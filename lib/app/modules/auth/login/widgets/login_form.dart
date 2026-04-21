part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AgendaJaTextformField(
            label: 'Login',
            controller: _emailController,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          AgendaJaTextformField(
            label: 'Senha',
            controller: _passwordController,
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          AgendaapButtonDefault(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Call the login function from AuthService
                  Modular.get<LoginController>()
                      .login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  )
                      .then((result) {
                    if (result) {
                      // Navigate to home page on success
                      // Modular.to.navigate(AppRoutes.home);
                    } else {
                      Messages.alert('Login falhou. Verifique suas credenciais.');
                    }
                  });
                } else {
                  Messages.alert('Por favor, preencha todos os campos corretamente.');
                }
              },
              label: 'Entrar'),
        ],
      ),
    );
  }
}
