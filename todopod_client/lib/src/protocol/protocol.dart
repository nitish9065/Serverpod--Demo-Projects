/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'app.user.dart' as _i2;
import 'category.dart' as _i3;
import 'example.dart' as _i4;
import 'exceptions/app_exception.dart' as _i5;
import 'task.dart' as _i6;
import 'package:todopod_client/src/protocol/category.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'app.user.dart';
export 'category.dart';
export 'example.dart';
export 'exceptions/app_exception.dart';
export 'task.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.AppUser) {
      return _i2.AppUser.fromJson(data) as T;
    }
    if (t == _i3.Category) {
      return _i3.Category.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.AppException) {
      return _i5.AppException.fromJson(data) as T;
    }
    if (t == _i6.Task) {
      return _i6.Task.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AppUser?>()) {
      return (data != null ? _i2.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AppException?>()) {
      return (data != null ? _i5.AppException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Task?>()) {
      return (data != null ? _i6.Task.fromJson(data) : null) as T;
    }
    if (t == List<_i7.Category>) {
      return (data as List).map((e) => deserialize<_i7.Category>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.AppUser) {
      return 'AppUser';
    }
    if (data is _i3.Category) {
      return 'Category';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.AppException) {
      return 'AppException';
    }
    if (data is _i6.Task) {
      return 'Task';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'AppUser') {
      return deserialize<_i2.AppUser>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i3.Category>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'AppException') {
      return deserialize<_i5.AppException>(data['data']);
    }
    if (data['className'] == 'Task') {
      return deserialize<_i6.Task>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
