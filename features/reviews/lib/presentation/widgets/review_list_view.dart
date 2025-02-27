import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';
import 'package:ui/ui.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({super.key});

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
            LoadSuccess() => Column(
              spacing: 16.w,
              children:
                  state.reviews
                      .map((review) => ReviewListItemWidget(review: review))
                      .asList(),
            ),
          };
        },
      ),
    );
  }
}
