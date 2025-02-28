import 'package:flutter/material.dart';
import 'package:products/presentation/widgets/product_image_widget.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewListItemWidget extends StatelessWidget {
  const ReviewListItemWidget({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 104.w,
                height: 104.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Color(0xffe0e0e0), width: 1.w),
                ),
                child: ProductImageWidget(url: review.product.imageUrl),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.product.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        StarScore(score: review.rating, starSize: 21.w),
                        SizedBox(width: 8.w),
                        Text(
                          review.rating.toString(),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.w),
          Divider(),
          SizedBox(height: 4.w),
        ],
      ),
    );
  }
}
