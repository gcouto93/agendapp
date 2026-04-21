import 'package:agenda_ja_app/app/modules/auth/auth_module.dart';
import 'package:agenda_ja_app/app/modules/core/core_module.dart';
import 'package:agenda_ja_app/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module('/auth/', module: AuthModule());
    r.module('/home/', module: HomeModule());
    super.routes(r);
  }
}
