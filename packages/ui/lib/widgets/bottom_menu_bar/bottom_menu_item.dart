import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    super.key,
    required this.assetIconPath,
    required this.label,
    this.isSelected = false,
  });

  final String assetIconPath;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(assetIconPath, size: 28.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: Color(isSelected ? 0xFF1D1D1D : 0xFFD9D9D9),
            ),
          ),
        ],
      ),
    );
  }
}
