import 'package:serverpod/serverpod.dart';
import 'package:todopod_server/src/generated/protocol.dart';
import 'package:todopod_server/src/services/auth_service.dart';

class AppUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> updateBio(Session session, String bio) async {
    try {
      final user = await AuthService.currentUser(session);
      await AppUser.db.updateRow(
        session,
        user.copyWith(bio: bio),
      );
      return true;
    } on AppException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw AppException(
        readableMessage: 'Failed to update bio for user',
        serverMessage: error.toString(),
        statusCode: 500,
        stackTrace: stackTrace.toString(),
      );
    }
  }
}
