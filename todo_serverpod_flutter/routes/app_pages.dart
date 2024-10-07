import 'package:get/get.dart';

import 'package:todo_serverpod/app/modules/account/bindings/account_binding.dart';
import 'package:todo_serverpod/app/modules/account/views/account_view.dart';
import 'package:todo_serverpod/app/modules/auth/bindings/auth_binding.dart';
import 'package:todo_serverpod/app/modules/auth/views/auth_view.dart';
import 'package:todo_serverpod/app/modules/home/bindings/home_binding.dart';
import 'package:todo_serverpod/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
  ];
}
