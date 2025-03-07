import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/presentation/blocs/reviews_loader/reviews_loader_bloc.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsLoaderBloc, ReviewsLoaderState>(
      builder: (context, state) {
        return switch (state) {
          Initial() => SizedBox(),
          Loading() => const Center(child: CircularProgressIndicator()),
          LoadFailure() => Center(
            child: Column(
              children: [
                Text('Something went wrong'),
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
              ],
            ),
          ),
          LoadSuccess() => Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 13.5.w,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffe0e0e0), width: 1.w),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: '작성한 리뷰 ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: '총 ${state.reviews.size}개',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff616161),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 4.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff868686),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(23.w / 2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '리뷰순',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff868686),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.arrow_drop_down, size: 16.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.w),
                ...state.reviews
                    .map((review) => ReviewListItemWidget(review: review))
                    .asList(),
              ],
            ),
          ),
        };
      },
    );
  }
}
