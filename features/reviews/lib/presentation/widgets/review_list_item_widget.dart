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
      constraints: BoxConstraints(maxHeight: 106.w),
      child: Row(
        children: [
          Container(
            width: 104.w,
            height: 104.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
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
                              height: 21.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Color(0xfff0f0f0),
                              ),
                              child: Text(keyword),
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
