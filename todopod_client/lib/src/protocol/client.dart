/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todopod_client/src/protocol/category.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointAppUser extends _i1.EndpointRef {
  EndpointAppUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appUser';

  _i2.Future<bool> updateBio(String bio) => caller.callServerEndpoint<bool>(
        'appUser',
        'updateBio',
        {'bio': bio},
      );
}

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<int> createCategory({
    required String name,
    String? desc,
  }) =>
      caller.callServerEndpoint<int>(
        'category',
        'createCategory',
        {
          'name': name,
          'desc': desc,
        },
      );

  _i2.Future<_i3.Category> findById(int id) =>
      caller.callServerEndpoint<_i3.Category>(
        'category',
        'findById',
        {'id': id},
      );

  _i2.Future<bool> deleteCategory(int categoryId) =>
      caller.callServerEndpoint<bool>(
        'category',
        'deleteCategory',
        {'categoryId': categoryId},
      );

  _i2.Future<List<_i3.Category>> fetchCategoriesByUserId() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'fetchCategoriesByUserId',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    appUser = EndpointAppUser(this);
    category = EndpointCategory(this);
    example = EndpointExample(this);
    modules = _Modules(this);
  }

  late final EndpointAppUser appUser;

  late final EndpointCategory category;

  late final EndpointExample example;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'appUser': appUser,
        'category': category,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
