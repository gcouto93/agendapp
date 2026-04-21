import 'package:agenda_ja_app/app/models/user_model.dart';
import 'package:agenda_ja_app/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authStore;

  const AuthHomePage({super.key, required AuthStore authStore}) : _authStore = authStore;

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  void initState() {
    super.initState();
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogger) {
      if (userLogger != null && userLogger.email.isEmpty) {
        Modular.to.navigate('/auth/login/');
      } else {
        Modular.to.navigate('/home');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._authStore.loadUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.sencodary,
      body: Center(
        child: Image.asset(
          'assets/images/logo_principal.png',
          fit: BoxFit.contain,
          width: 350.w,
          height: 400.h,
        ),
      ),
    );
  }
}
