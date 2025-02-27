import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewListItemWidget extends StatelessWidget {
  const ReviewListItemWidget({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 106.w),
      child: Row(
        children: [
          Container(
            width: 104.w,
            height: 104.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: Colors.grey),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(review.product.name, overflow: TextOverflow.ellipsis),
                ...review.reviewers
                    .map(
                      (reviewer) => Text(
                        '• ${reviewer.content}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                    .asList(),
                SizedBox(height: 6.w),
                Row(
                  spacing: 4.w,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(
                      review.rating.toString(),
                      style: TextStyle(color: Colors.yellow),
                    ),
                    Text('(${review.reviewCount})'),
                  ],
                ),
                SizedBox(height: 6.w),
                Row(
                  spacing: 4.w,
                  children:
                      review.keywords
                          .map(
                            (keyword) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Color(0xfff0f0f0),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 5.w,
                                horizontal: 6.w,
                              ),
                              child: Center(
                                child: Text(
                                  keyword,
                                  style: TextStyle(fontSize: 11.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                          .asList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
