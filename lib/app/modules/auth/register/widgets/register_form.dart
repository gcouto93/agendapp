part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um e-mail';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Por favor, insira um e-mail válido';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            AgendaJaTextformField(
              label: 'Senha',
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma senha';
                }
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            AgendaJaTextformField(
              label: 'Confirmar senha',
              controller: _confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirme a senha';
                }
                if (value != _passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            _isLoading
                ? CircularProgressIndicator()
                : AgendaapButtonDefault(
                    onPressed: () => _registerUser(),
                    label: 'Cadastrar',
                  )
          ],
        ));
  }

  Future<void> _registerUser() async {
    // Validar o formulário
    if (!_formKey.currentState!.validate()) {
      return;
    }

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
