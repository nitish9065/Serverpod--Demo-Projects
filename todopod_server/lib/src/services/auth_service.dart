// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:serverpod/serverpod.dart';
import 'package:todopod_server/src/generated/protocol.dart';

class AuthService {
  AuthService._();

  static Future<AppUser> currentUser(Session session) async {
    final _currentUserId = await currentUserId(session);
    final user = await AppUser.db.findFirstRow(
      session,
      where: (userRow) => userRow.userInfoId.equals(_currentUserId),
    );
    if (user == null) {
      throw AppException(
        readableMessage: 'User not found with provided credentials.',
        serverMessage: 'User not found in db with provided session details.',
        statusCode: 404,
      );
    }
    return user;
  }

  static Future<int> currentUserId(Session session) async {
    final AuthenticationInfo? authInfo = await session.authenticated;
    if (authInfo == null) {
      throw AppException(
        readableMessage: 'User not authenticated.',
        serverMessage: '',
        statusCode: 401,
      );
    }
    return authInfo.userId;
  }
}
