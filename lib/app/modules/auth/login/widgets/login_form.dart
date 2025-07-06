part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AgendaJaTextformField(
            label: 'Login',
            controller: widget.emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          AgendaJaTextformField(
            label: 'Senha',
            controller: widget.passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          AgendaapButtonDefault(onPressed: () {}, label: 'Entrar'),
        ],
      ),
    );
  }
}
