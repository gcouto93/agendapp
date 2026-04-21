import 'package:agenda_ja_app/app/core/ui/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class AgendaapButtonDefault extends StatelessWidget {
  final VoidCallback onPressed;
  final double borderRadius;
  final String label;
  final Color? color;
  final Color? labelColor;
  final double labelSize;
  final double padding;
  final double width;
  final double height;

  const AgendaapButtonDefault(
      {super.key,
      required this.onPressed,
      this.borderRadius = 8.0,
      required this.label,
      this.color,
      this.labelColor,
      this.labelSize = 20,
      this.padding = 10,
      this.width = double.infinity,
      this.height = 66});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor ?? context.primaryColorLight,
          ),
        ),
      ),
    );
  }
}
