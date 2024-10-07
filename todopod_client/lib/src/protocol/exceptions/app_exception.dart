/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AppException
    implements _i1.SerializableException, _i1.SerializableModel {
  AppException._({
    required this.readableMessage,
    required this.serverMessage,
    required this.statusCode,
    this.stackTrace,
  });

  factory AppException({
    required String readableMessage,
    required String serverMessage,
    required int statusCode,
    String? stackTrace,
  }) = _AppExceptionImpl;

  factory AppException.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppException(
      readableMessage: jsonSerialization['readableMessage'] as String,
      serverMessage: jsonSerialization['serverMessage'] as String,
      statusCode: jsonSerialization['statusCode'] as int,
      stackTrace: jsonSerialization['stackTrace'] as String?,
    );
  }

  String readableMessage;

  String serverMessage;

  int statusCode;

  String? stackTrace;

  AppException copyWith({
    String? readableMessage,
    String? serverMessage,
    int? statusCode,
    String? stackTrace,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'readableMessage': readableMessage,
      'serverMessage': serverMessage,
      'statusCode': statusCode,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppExceptionImpl extends AppException {
  _AppExceptionImpl({
    required String readableMessage,
    required String serverMessage,
    required int statusCode,
    String? stackTrace,
  }) : super._(
          readableMessage: readableMessage,
          serverMessage: serverMessage,
          statusCode: statusCode,
          stackTrace: stackTrace,
        );

  @override
  AppException copyWith({
    String? readableMessage,
    String? serverMessage,
    int? statusCode,
    Object? stackTrace = _Undefined,
  }) {
    return AppException(
      readableMessage: readableMessage ?? this.readableMessage,
      serverMessage: serverMessage ?? this.serverMessage,
      statusCode: statusCode ?? this.statusCode,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
    );
  }
}
