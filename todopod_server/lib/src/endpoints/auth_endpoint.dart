import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import 'package:todopod_server/src/generated/protocol.dart';

class AuthEndpoint extends Endpoint {
  
  Future<bool> createAccount(Session session,
      {required String name,
      required String email,
      required String password}) async {
    try {
      String userName = await _generateUserName(session, name);
      return await Emails.createAccountRequest(
              session, userName, email, password)
          .then((isRequested) async {
        if (isRequested == false) {
          return false;
        }
        return await Emails.findAccountRequest(session, email)
            .then((request) async {
          if (request == null) {
            return false;
          }
          var userInfo = await Users.findUserByEmail(session, email);

          if (userInfo == null) {
            userInfo = UserInfo(
              userIdentifier: email,
              email: email,
              userName: userName,
              fullName: name,
              created: DateTime.now(),
              scopeNames: [],
              blocked: false,
            );

            session.log('creating user', level: LogLevel.debug);
            userInfo = await Users.createUser(session, userInfo, 'email');
            if (userInfo == null) {
              throw AppException(
                readableMessage: 'Failed to create user',
                serverMessage: 'Failed to insert userinfo data to table.',
                statusCode: 500,
              );
            }
          }

          // Check if there is email authentication in place already
          var oldAuth = await EmailAuth.db.findFirstRow(
            session,
            where: (t) => t.userId.equals(userInfo?.id!),
          );
          if (oldAuth != null) {
            return true;
          }
          session.log('creating email auth', level: LogLevel.debug);
          var auth = EmailAuth(
            userId: userInfo.id!,
            email: email,
            hash: request.hash,
          );

          await EmailAuth.db.insertRow(session, auth);

          await UserImages.setDefaultUserImage(session, userInfo.id!);
          await Users.invalidateCacheForUser(session, userInfo.id!);
          userInfo = await Users.findUserByUserId(session, userInfo.id!);

          session.log('returning created user', level: LogLevel.debug);
          return true;
        });
      });
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while creating account.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<bool> login(
    Session session,
    String email,
    String password,
  ) async {
    try {
      AuthenticationResponse authenticationResponse =
          await Emails.authenticate(session, email, password);
      if (authenticationResponse.success == false ||
          authenticationResponse.userInfo == null) {
        return false;
      }
      return true;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Error occurred while logging into account.',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }

  Future<String> _generateUserName(Session session, String fullname) async {
    bool isAvailable = false;
    String tempUsername = '';
    fullname = fullname.split('').first;
    while (isAvailable) {
      tempUsername = fullname + genarteRandomDigits(4);
      var user = await AppUser.db.findFirstRow(
        session,
        where: (u) => u.userInfo.userName.equals(
          tempUsername,
        ),
      );
      if (user == null) {
        isAvailable = false;
        break;
      }
    }
    return tempUsername;
  }

  String genarteRandomDigits(int n) {
    Random random = Random();

    // Calculate the range of numbers that have n digits
    int min = pow(10, n - 1).toInt(); // Minimum n-digit number
    int max = pow(10, n).toInt() - 1; // Maximum n-digit number

    // Generate a random n-digit number within the calculated range
    final randoms = min + random.nextInt(max - min + 1);
    return randoms.toString();
  }
}
