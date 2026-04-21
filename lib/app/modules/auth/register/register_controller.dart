import 'package:agenda_ja_app/app/core/exceptions/user_exists_exception.dart';
import 'package:agenda_ja_app/app/core/logger/app_logger.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/loader.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/messages.dart';
import 'package:agenda_ja_app/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final UserService userService;
  final AppLogger log;

  _RegisterControllerBase(
    this.userService,
    this.log,
  );
  // _RegisterControllerBase();

  void register({required String email, required String password}) async {
    try {
      Loader.show();
      await userService.register(email: email, password: password);
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert('Este e-mail já está em uso');
      // TODO
    } catch (e, s) {
      // log.error('Erro ao registrar usuário', e, s);
      Loader.hide();
      Messages.alert('Erro ao registrar usuário');
    }
  }
}
