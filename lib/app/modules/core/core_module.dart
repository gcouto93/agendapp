import 'package:agenda_ja_app/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {}
  @override
  void exportedBinds(Injector i) {
    // TODO: implement exportedBinds
    super.exportedBinds(i);
    i.addLazySingleton(() => AuthStore());
  }
}
