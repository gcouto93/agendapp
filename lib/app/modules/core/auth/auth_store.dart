import 'package:agenda_ja_app/app/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    _userLogged = UserModel.empty();
  }
}
