import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.path, this.size});

  final String path;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      package: 'ui',
      width: size ?? 24.w,
      height: size ?? 24.w,
    );
  }
}
