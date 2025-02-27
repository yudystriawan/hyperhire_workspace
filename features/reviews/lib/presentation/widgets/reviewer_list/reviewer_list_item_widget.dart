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
          Container(decoration: BoxDecoration(shape: BoxShape.circle)),
          SizedBox(height: 10.w),
          Text('Name', style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
