// ignore_for_file: non_constant_identifier_names

// import 'package:App_Construmanager/l10n/commom.dart';
// import 'package:App_Construmanager/main.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SnackMessage {
  Message(String title) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text(title),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  SuccessMessage(String msg) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text('Sucesso: $msg'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Error(String title, [int duration = 2]) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text(title),
        duration: Duration(seconds: duration),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  ErrorMessage(String msg) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text('Erro: $msg'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  WarningMessage(String msg) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text('Aviso: $msg'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Navegation(String path) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text('Navegando para $path!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Tool(String tool) {
    BuildContext context = MyApp.navigatorKey.currentContext!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 15,
        content: Text('Abrindo $tool!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
