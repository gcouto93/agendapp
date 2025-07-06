import 'package:agenda_ja_app/app/core/ui/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class AgendaJaTextformField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  AgendaJaTextformField({super.key, required this.label, this.obscureText = false, required this.controller, this.validator})
      : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _obscureTextVN,
        builder: (_, obscureTextVNValue, __) {
          return TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureTextVNValue,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Color.fromARGB(255, 91, 85, 203), fontSize: 15),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), gapPadding: 0, borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), gapPadding: 5),
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscureTextVN.value = !_obscureTextVN.value;
                        },
                        icon: Icon(
                          obscureTextVNValue ? Icons.lock : Icons.lock_open,
                          color: context.primaryColor,
                        ))
                    : null),
          );
        });
  }
}
