import 'package:agenda_ja_app/app/modules/auth/home/auth_home_page.dart';
import 'package:agenda_ja_app/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    super.routes(r);
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
