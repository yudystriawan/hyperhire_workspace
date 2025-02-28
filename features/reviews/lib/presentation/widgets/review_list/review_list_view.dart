import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/presentation/blocs/reviews_loader/reviews_loader_bloc.dart';
import 'package:reviews/reviews.dart';

class ReviewListView extends StatelessWidget {
  const ReviewListView({super.key, this.userId});

  final String? userId;

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
                IconButton(
                  onPressed:
                      () => context.read<ReviewsLoaderBloc>().add(
                        ReviewsLoaderEvent.fetched(userId: userId),
                      ),
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          LoadSuccess() => Column(
            children:
                state.reviews
                    .map((review) => ReviewListItemWidget(review: review))
                    .asList(),
          ),
        };
      },
    );
  }
}
