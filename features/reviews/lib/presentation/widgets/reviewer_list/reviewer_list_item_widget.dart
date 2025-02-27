import 'package:flutter/material.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';
import 'package:users/users.dart';

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
              border: Border.all(color: Colors.transparent, width: 1.w),
            ),
            child: UserProfileImage(url: reviewer.user.profileImageUrl),
          ),
          SizedBox(height: 10.w),
          Text(
            reviewer.user.name,
            style: TextStyle(fontSize: 14.sp, color: Color(0xff616161)),
          ),
        ],
      ),
    );
  }
}
