import 'package:flutter/material.dart';
import 'package:products/presentation/widgets/product_image_widget.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewListItemWidget extends StatelessWidget {
  const ReviewListItemWidget({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff616161)),
                  ),
                  StarScore(score: review.rating),
                ],
              ),
            ),
          ],
        ),
        Divider(height: 8.w),
        SizedBox(height: 4.w),
      ],
    );
  }
}
