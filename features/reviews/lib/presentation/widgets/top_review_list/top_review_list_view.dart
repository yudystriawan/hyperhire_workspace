import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/presentation/blocs/top_products_loader/top_products_loader_bloc.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class TopReviewListView extends StatelessWidget {
  const TopReviewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<TopProductsLoaderBloc>()
                ..add(TopProductsLoaderEvent.fetched()),
      child: BlocBuilder<TopProductsLoaderBloc, TopProductsLoaderState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => SizedBox(),
            LoadInProgress() => const Center(
              child: CircularProgressIndicator(),
            ),
            LoadFailure() => Center(
              child: Column(
                children: [
                  Text('Something went wrong'),
                  IconButton(
                    onPressed:
                        () => context.read<TopProductsLoaderBloc>().add(
                          TopProductsLoaderEvent.fetched(),
                        ),
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
            LoadSuccess() => Container(
              constraints: BoxConstraints(minHeight: 466.w),
              color: Colors.white,
              padding: EdgeInsets.all(16.w).copyWith(top: 28.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제일 핫한 리뷰를 만나보세요',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xff616161),
                              ),
                            ),
                            Text(
                              '리뷰️  랭킹⭐ top 3',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.w),
                  ...state.reviews
                      .mapIndexed(
                        (index, review) => TopReviewListItemWidget(
                          review: review,
                          crownAsset: _mapCrownAsset(index),
                        ),
                      )
                      .asList(),
                ],
              ),
            ),
          };
        },
      ),
    );
  }

  String _mapCrownAsset(int index) {
    return switch (index) {
      0 => AppIcons.icCrownFirst,
      1 => AppIcons.icCrownSecond,
      2 => AppIcons.icCrownThird,
      _ => 'ic_crown_default.png',
    };
  }
}
