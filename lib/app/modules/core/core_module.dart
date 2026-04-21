import 'package:agenda_ja_app/app/core/local_storage/flutter_secure_storage/flutter_secure_storage_local_storage_impl.dart';
import 'package:agenda_ja_app/app/core/local_storage/local_storage.dart';
import 'package:agenda_ja_app/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:agenda_ja_app/app/core/logger/app_logger.dart';
import 'package:agenda_ja_app/app/core/logger/logger_app_logger_impl.dart';
import 'package:agenda_ja_app/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:agenda_ja_app/app/core/rest_client/rest_client.dart';
import 'package:agenda_ja_app/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<RestClient>(
      () => DioRestClient(),
    );
    // i.addLazySingleton<AppLogger>(
    //   () => LoggerAppLoggerImpl(),
    // );
    i.addSingleton<AppLogger>(LoggerAppLoggerImpl.new);
    i.addLazySingleton<LocalStorage>(
      () => SharedPreferencesLocalStorageImpl(),
    );
    i.addLazySingleton<LocalSecureStorage>(
      () => FlutterSecureStorageLocalStorageImpl(),
    );
  }

  @override
  // TODO: implement imports
  List<Module> get imports => super.imports;

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(() => AuthStore());
    // i.addLazySingleton<AppLogger>(
    //   () => LoggerAppLoggerImpl(),
    // );
    super.exportedBinds(i);
  }
}
