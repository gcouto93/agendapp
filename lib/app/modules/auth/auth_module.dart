import 'package:agenda_ja_app/app/modules/auth/home/auth_home_page.dart';
import 'package:agenda_ja_app/app/modules/auth/login/login_module.dart';
import 'package:agenda_ja_app/app/modules/auth/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(Modular.initialRoute,
        child: (_) => AuthHomePage(
              authStore: Modular.get(),
            ));
    r.module('/login', module: LoginModule());
    r.module('/register', module: RegisterModule());
  }
}
