import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:products/presentation/widgets/product_image_widget.dart';
import 'package:reviews/presentation/blocs/reviews_loader/reviews_loader_bloc.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';
import 'package:users/users.dart';

class ReviewListItemWidget extends StatelessWidget {
  const ReviewListItemWidget({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.read<ReviewsLoaderBloc>().userId;

    // get reviewer from review based on currentUserId
    Reviewer? reviewer;
    reviewer = review.reviewers.find(
      (reviewer) => reviewer.user.id == currentUserId,
    );

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
          if (reviewer != null) SizedBox(height: 4.w),
          Row(
            children: [
              UserProfileImage(
                url: reviewer!.user.profileImageUrl,
                width: 34.w,
                height: 34.w,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviewer.user.name, style: TextStyle(fontSize: 14.sp)),
                    Row(
                      children: [
                        StarScore(score: reviewer.score, starSize: 11.w),
                        SizedBox(width: 4.w),
                        Text(
                          reviewer.createdAt.formatted('yyyy.MM.dd'),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Color(0xff868686),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 6.w),
              AppIcon(AppIcons.icBookmarkOutlined),
            ],
          ),
          SizedBox(height: 27.w),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20.w,
              children: [
                ...review.keywords
                    .map(
                      (keyword) => Text(
                        '“$keyword”',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0xffA0A0A0),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                    .asList(),
              ],
            ),
          ),
          SizedBox(height: 18.w),
          Column(
            spacing: 8.w,
            children:
                reviewer.pros
                    .map(
                      (content) => Text(
                        content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff616161),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                    .asList(),
          ),
          SizedBox(height: 18.w),
          Column(
            spacing: 8.w,
            children:
                reviewer.cons
                    .map(
                      (content) => Text(
                        content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff616161),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                    .asList(),
          ),
          SizedBox(height: 15.w),
          Row(
            spacing: 8.w,
            children:
                reviewer.imageUrls
                    .map(
                      (imageUrl) => Container(
                        constraints: BoxConstraints(
                          maxWidth: 101.w,
                          maxHeight: 101.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffe0e0e0),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/$imageUrl',
                              package: 'reviews',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .asList(),
          ),
          Divider(height: 20.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppIcon(AppIcons.icChat, size: 12.w),
              SizedBox(width: 8.w),
              Text(
                '댓글 달기..',
                style: TextStyle(fontSize: 10.sp, color: Color(0xff616161)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
