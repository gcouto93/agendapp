import 'package:agenda_ja_app/app/core/helpers/environments.dart';
import 'package:agenda_ja_app/app/core/ui/extensions/size_screen_extension.dart';
import 'package:agenda_ja_app/app/core/ui/extensions/theme_extensions.dart';
import 'package:agenda_ja_app/app/core/ui/icons/agendaap_icons.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/agenda_ja_textform_field.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/agendaap_button_default.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:agenda_ja_app/layout/snack_message.dart';
import 'package:agenda_ja_app/services/auth_service.dart';
import 'package:agenda_ja_app/utility/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../pages/register_page.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSecurePassWord = true;
  final _formKey = GlobalKey<FormState>();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(Environments.param('base_url') ?? ' '),
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo_principal.png',
                width: 320.w,
                fit: BoxFit.contain,
                color: context.primaryColorDark,
              ),
            ),
            _LoginForm(),
            SizedBox(
              height: 8.h,
            ),
            _OrSeparator(),
            SizedBox(
              height: 8,
            ),
            _LoginRegisterButtons()
          ],
        ),
      ),
    ));
  }

  loginButton(BuildContext context) async {
    if (_emailController.text.isEmpty & _passwordController.text.isEmpty) {
      return SnackMessage().Error('Preencha e-mail/senha');
    }
    var loginSucces = await _authService.loginUser(email: _emailController.text, password: _passwordController.text);
    if (loginSucces == null) {
      Navigator.pushNamed(context, AppRoutes.Home);
    }
  }

  IconButton _togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassWord = !_isSecurePassWord;
          });
        },
        icon: _isSecurePassWord ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        color: Colors.grey);
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'OU',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, color: Theme.of(context).primaryColor),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
