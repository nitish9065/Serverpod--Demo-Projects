import 'package:todopod_server/src/generated/protocol.dart';

extension NullableExtension<T> on T? {

  /// Return the `T` type value if null safe else throw custome `AppException()`
  ///  with provided details.
  T orElseThrow({
    required String readableMessage,
    required String serverMessage,
    required int statusCode,
    String? stackTrace,
  }) {
    if (this == null) {
      throw AppException(
        readableMessage: readableMessage,
        serverMessage: serverMessage,
        statusCode: statusCode,
      );
    } else {
      return this!;
    }
  }
}
