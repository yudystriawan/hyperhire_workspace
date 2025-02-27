import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/presentation/blocs/top_reviewers_loader/top_reviewers_loader_bloc.dart';
import 'package:reviews/presentation/widgets/reviewer_list/reviewer_list_item_widget.dart';
import 'package:ui/ui.dart';

class ReviewerListView extends StatelessWidget {
  const ReviewerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<TopReviewersLoaderBloc>()
                ..add(TopReviewersLoaderEvent.fetched()),
      child: BlocBuilder<TopReviewersLoaderBloc, TopReviewersLoaderState>(
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
                        () => context.read<TopReviewersLoaderBloc>().add(
                          TopReviewersLoaderEvent.fetched(),
                        ),
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
            LoadSuccess() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16.w,
                children:
                    state.reviewers
                        .mapIndexed(
                          (index, reviewer) => ReviewerListItemWidget(
                            reviewer: reviewer,
                            topReviewer: index == 0,
                          ),
                        )
                        .asList(),
              ),
            ),
          };
        },
      ),
    );
  }
}
