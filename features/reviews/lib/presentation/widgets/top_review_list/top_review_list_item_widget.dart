import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:products/presentation/widgets/product_image_widget.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';
import 'package:ui/widgets/icon.dart';

class TopReviewListItemWidget extends StatelessWidget {
  const TopReviewListItemWidget({
    super.key,
    required this.review,
    required this.crownAsset,
  });

  final Review review;
  final String crownAsset;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 106.w),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 104.w,
                height: 104.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: ProductImageWidget(url: review.product.imageUrl),
              ),
              Positioned(
                top: 6.w,
                left: 6.w,
                child: AppIcon(crownAsset, size: 15.w),
              ),
            ],
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.product.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ...review.getAllReviewContent
                    .map(
                      (content) => Text(
                        '• $content',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    )
                    .asList(),
                SizedBox(height: 6.w),
                Row(
                  spacing: 4.w,
                  children: [
                    AppIcon(AppIcons.icStarFilled, size: 10.w),
                    Text(
                      review.rating.toString(),
                      style: TextStyle(
                        color: Color(0xffffd233),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      '(${review.reviewCount})',
                      style: TextStyle(
                        color: Color(0xffc4c4c4),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.w),
                Row(
                  spacing: 4.w,
                  children:
                      review.keywords
                          .map((keyword) => AppChip(label: keyword))
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
