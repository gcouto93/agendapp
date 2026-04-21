import 'package:agenda_ja_app/pages/home_page.dart';
import 'package:agenda_ja_app/app/modules/auth/login/login_page.dart';
import 'package:agenda_ja_app/utility/app_routes.dart';

import '../pages/register_page.dart';

class RoutesConfig {
  static var init = {
    // AppRoutes.RouteScreen: (ctx) => const RouteScreen(),
    AppRoutes.Login: (ctx) => const LoginPage(),
    AppRoutes.Cadastro: (ctx) => const RegisterPage(),
    AppRoutes.Home: (ctx) => const HomePage(),
  };
}
