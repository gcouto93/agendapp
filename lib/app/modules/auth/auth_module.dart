import 'package:agenda_ja_app/app/modules/auth/home/auth_home_page.dart';
import 'package:agenda_ja_app/app/modules/auth/login/login_module.dart';
import 'package:agenda_ja_app/app/modules/auth/register/register_module.dart';
import 'package:agenda_ja_app/app/modules/core/core_module.dart';
import 'package:agenda_ja_app/app/repositories/user/user_repository.dart';
import 'package:agenda_ja_app/app/repositories/user_repository_impl.dart';
import 'package:agenda_ja_app/app/services/user/user_service.dart';
import 'package:agenda_ja_app/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<UserRepository>(() => UserRepositoryImpl());
    i.addLazySingleton<UserService>(
      () => UserServiceImpl(
        userRepository: i.get<UserRepository>(),
        log: i.get(),
      ),
    );
    super.binds(i);
  }

  @override
  void exportedBinds(Injector i) {
    // i.addLazySingleton<UserService>(() => UserServiceImpl());
    super.exportedBinds(i);
  }

  @override
  List<Module> get imports => [AuthModule(), CoreModule()];

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(Modular.initialRoute,
        child: (_) => AuthHomePage(
              authStore: Modular.get(),
            ));
    r.module('/login/', module: LoginModule());
    r.module('/register/', module: RegisterModule());
  }
}
