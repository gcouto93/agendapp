import 'package:agenda_ja_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailRegisterController = TextEditingController();
  final _nameRegisterController = TextEditingController();
  final _passwordRegisterController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Seu nome',
                    ),
                    controller: _nameRegisterController,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Seu email',
                    ),
                    controller: _emailRegisterController,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    controller: _passwordRegisterController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      registerButton();
                    },
                    child: const Text('Confirmar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerButton() {
    authService.registerUser(name: _nameRegisterController.text, email: _emailRegisterController.text, password: _passwordRegisterController.text);
  }
}
