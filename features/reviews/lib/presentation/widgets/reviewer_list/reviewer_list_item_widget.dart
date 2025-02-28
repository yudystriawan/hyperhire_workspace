import 'package:flutter/material.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';
import 'package:users/users.dart';

class ReviewerListItemWidget extends StatelessWidget {
  const ReviewerListItemWidget({
    super.key,
    required this.reviewer,
    this.topReviewer = false,
    this.onTap,
  });

  final Reviewer reviewer;
  final bool topReviewer;
  final Function(String userId)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(reviewer.user.id) : null,
      child: Stack(
        children: [
          SizedBox(
            width: 62.w,
            height: 106.w,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 62.w,
                    height: 62.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            topReviewer
                                ? Color(0xffFFD233)
                                : Colors.transparent,
                        width: topReviewer ? 4.w : 1.w,
                      ),
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
            ),
          ),
          if (topReviewer)
            Positioned(
              top: 0,
              left: 0,
              child: AppIcon(AppIcons.icCrownGold, size: 15.w),
            ),
        ],
      ),
    );
  }
}
