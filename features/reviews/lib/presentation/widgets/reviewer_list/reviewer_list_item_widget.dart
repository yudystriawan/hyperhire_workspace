import 'package:flutter/material.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewerListItemWidget extends StatelessWidget {
  const ReviewerListItemWidget({
    super.key,
    required this.reviewer,
    this.topReviewer = false,
  });

  final Reviewer reviewer;
  final bool topReviewer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62.w,
      height: 106.w,
      child: Column(
        children: [
          Container(
            width: 62.w,
            height: 62.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: topReviewer ? Color(0xffFFD233) : Colors.transparent,
                width: topReviewer ? 4.w : 1.w,
              ),
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            'Name',
            style: TextStyle(fontSize: 14.sp, color: Color(0xff616161)),
          ),
        ],
      ),
    );
  }
}
