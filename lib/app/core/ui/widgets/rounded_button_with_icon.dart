import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButtonWithIcon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double width;
  final Color color;
  final IconData icon;
  final String label;

  const RoundedButtonWithIcon({super.key, required this.onTap, required this.width, required this.color, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          // border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 2.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20.w,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(color: Colors.white, thickness: 2),
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Text(
                label,
                style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
