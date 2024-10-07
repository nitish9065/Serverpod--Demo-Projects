/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/app_user_endpoint.dart' as _i2;
import '../endpoints/category_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'appUser': _i2.AppUserEndpoint()
        ..initialize(
          server,
          'appUser',
          null,
        ),
      'category': _i3.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['appUser'] = _i1.EndpointConnector(
      name: 'appUser',
      endpoint: endpoints['appUser']!,
      methodConnectors: {
        'updateBio': _i1.MethodConnector(
          name: 'updateBio',
          params: {
            'bio': _i1.ParameterDescription(
              name: 'bio',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i2.AppUserEndpoint).updateBio(
            session,
            params['bio'],
          ),
        )
      },
    );
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'createCategory': _i1.MethodConnector(
          name: 'createCategory',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).createCategory(
            session,
            name: params['name'],
            desc: params['desc'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).findById(
            session,
            params['id'],
          ),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint).deleteCategory(
            session,
            params['categoryId'],
          ),
        ),
        'fetchCategoriesByUserId': _i1.MethodConnector(
          name: 'fetchCategoriesByUserId',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i3.CategoryEndpoint)
                  .fetchCategoriesByUserId(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
