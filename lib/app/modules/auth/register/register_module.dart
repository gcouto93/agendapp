import 'package:agenda_ja_app/app/core/logger/app_logger.dart';
import 'package:agenda_ja_app/app/modules/auth/auth_module.dart';
import 'package:agenda_ja_app/app/modules/auth/register/register_controller.dart';
import 'package:agenda_ja_app/app/modules/auth/register/register_page.dart';
import 'package:agenda_ja_app/app/modules/core/core_module.dart';
import 'package:agenda_ja_app/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(() => RegisterController(i.get<UserService>(), i.get<AppLogger>()));
    super.binds(i);
  }

  @override
  void exportedBinds(Injector i) {
    // i.add(() => RegisterController(i.get<UserService>(), i.get<AppLogger>()));
    // i.addLazySingleton<RegisterController>(() => RegisterController());
    super.exportedBinds(i);
  }

  @override
  List<Module> get imports => [AuthModule(), CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const RegisterPage());
    super.routes(r);
  }
}
