import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Loader {
  static OverlayEntry? _entry;

  static bool _open = false;

  Loader._();

  static void show() {
    final context = Modular.routerDelegate.navigatorKey.currentState?.overlay?.context;
    if (context == null) {
      print(
          '-----------------------------------------------Loader.show() called without a valid context -----------------------------------------------');
      return;
    }

    if (_open) return;
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
    Overlay.of(context, rootOverlay: true).insert(_entry!);
    _open = true;
  }

  static void hide() {
    if (_open) {
      _open = false;
      _entry?.remove();
      _entry = null;
    }
  }
}
