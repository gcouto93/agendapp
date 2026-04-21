part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Funcionalidade em desenvolvimento')),
            );
          },
          width: 200,
          color: const Color(0xffE15031),
          icon: Agendaap.google,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Funcionalidade em desenvolvimento')),
            );
          },
          width: 200,
          color: Theme.of(context).colorScheme.inversePrimary,
          icon: Agendaap.facebook_circled,
          label: 'Facebook',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/auth/register/');
          },
          width: 200,
          color: context.primaryColor,
          icon: Icons.email,
          label: 'Cadastre-se',
        ),
      ],
    );
  }
}
