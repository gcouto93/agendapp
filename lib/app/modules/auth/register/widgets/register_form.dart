part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final RegisterController controller = Modular.get<RegisterController>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            AgendaJaTextformField(
              label: 'E-mail',
              controller: _emailController,
              validator: Validatorless.multiple([
                Validatorless.required('E-mail obrigatório'),
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
            AgendaJaTextformField(
              label: 'Confirmar senha',
              controller: _confirmPasswordController,
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Confirmação de senha obrigatória'),
                Validatorless.compare(_passwordController, 'As senhas não coincidem'),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : AgendaapButtonDefault(
                    onPressed: _registerUser,
                    label: 'Cadastrar',
                  )
          ],
        ));
  }

  Future<void> _registerUser() async {
    // Validar o formulário
    final formValid = _formKey.currentState!.validate();
    if (!formValid) {
      return;
    }

    if (formValid) {
      controller.register(
        email: _emailController.text,
        password: _passwordController.text,
      );
      return;
    }
    return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Verificar se o usuário já existe
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(_emailController.text);

      if (methods.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este e-mail já está cadastrado')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Criar um novo usuário
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Enviar e-mail de verificação
      await userCredential.user?.sendEmailVerification();

      // Mostrar mensagem de sucesso
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso! Verifique seu e-mail.')),
        );

        // Navegar para a tela de login após cadastro bem-sucedido
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      String message = 'Ocorreu um erro ao cadastrar o usuário';

      if (e.code == 'weak-password') {
        message = 'A senha fornecida é muito fraca';
      } else if (e.code == 'email-already-in-use') {
        message = 'Este e-mail já está em uso';
      } else if (e.code == 'invalid-email') {
        message = 'O e-mail fornecido é inválido';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
