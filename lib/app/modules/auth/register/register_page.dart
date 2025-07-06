import 'package:agenda_ja_app/app/core/ui/extensions/size_screen_extension.dart';
import 'package:agenda_ja_app/app/core/ui/extensions/theme_extensions.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/agenda_ja_textform_field.dart';
import 'package:agenda_ja_app/app/core/ui/widgets/agendaap_button_default.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar usuário'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo_principal.png',
                  width: 320.w,
                  fit: BoxFit.contain,
                  color: context.primaryColorDark,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const _RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}
