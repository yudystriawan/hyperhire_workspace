import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        IconData icon;
        if (index < score.floor()) {
          icon = Icons.star;
        } else if (index < score) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(
          icon,
          color:
              index < score
                  ? (filledStarColor ?? Color(0xffFFD233))
                  : (unfilledStarColor ?? Color(0xffF0F0F0)),
          size: starSize ?? 24.w,
        );
      }),
    );
  }
}
