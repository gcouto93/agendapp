import 'package:agenda_ja_app/app/core/logger/app_logger.dart';
import 'package:agenda_ja_app/app/modules/auth/auth_module.dart';
import 'package:agenda_ja_app/app/modules/auth/login/login_controller.dart';
import 'package:agenda_ja_app/app/modules/auth/login/login_page.dart';
import 'package:agenda_ja_app/app/modules/core/core_module.dart';
import 'package:agenda_ja_app/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(() => LoginController(userService: i.get<UserService>(), log: i.get<AppLogger>()));
    super.binds(i);
  }

  @override
  List<Module> get imports => [AuthModule(), CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const LoginPage());
    super.routes(r);
  }
}
