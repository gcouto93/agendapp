import 'package:agenda_ja_app/app/core/exceptions/user_exists_exception.dart';
import 'package:agenda_ja_app/app/core/logger/app_logger.dart';
import 'package:agenda_ja_app/app/repositories/user/user_repository.dart';
import 'package:agenda_ja_app/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;

  UserServiceImpl({required UserRepository userRepository, required AppLogger log})
      : _userRepository = userRepository,
        _log = log;

  @override
  Future<void> register({required String email, required String password}) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userLogingMethod = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await userLogingMethod.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Mostre mensagem: Este e-mail já está em uso
        throw UserExistsException('Este e-mail já está em uso');
      } else {
        // Trate outros erros
      }
    }
  }
}
