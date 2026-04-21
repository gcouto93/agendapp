import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Messages {
  Messages._();

  static void alert(String message) {
    final context = Modular.routerDelegate.navigatorKey.currentState?.overlay?.context;
    if (context == null) {
      print(
          '-----------------------------------------------Messages.alert() called without a valid context -----------------------------------------------');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void info(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
