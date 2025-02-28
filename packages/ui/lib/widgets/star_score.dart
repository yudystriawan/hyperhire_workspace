import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class StarScore extends StatelessWidget {
  final double score;
  final int starCount;
  final Color? filledStarColor;
  final Color? unfilledStarColor;
  final double? starSize;

  const StarScore({
    super.key,
    required this.score,
    this.starCount = 5,
    this.filledStarColor,
    this.unfilledStarColor,
    this.starSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        String icon;
        if (index < score.floor()) {
          icon = AppIcons.icStarFilled;
        } else {
          icon = AppIcons.icStarOutlined;
        }
        return AppIcon(icon, size: starSize ?? 24.w);
      }),
    );
  }
}
