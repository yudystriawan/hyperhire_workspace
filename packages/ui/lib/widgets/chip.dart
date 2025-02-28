import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Color(0xfff0f0f0),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 6.w),
      child: Text(
        label,
        style: TextStyle(fontSize: 11.sp, color: Color(0xff868686)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
