import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/presentation/blocs/top_products_loader/top_products_loader_bloc.dart';
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
                      .mapIndexed(
                        (index, review) => ReviewListItemWidget(
                          review: review,
                          crownAsset: _mapCrownAsset(index),
                        ),
                      )
                      .asList(),
            ),
          };
        },
      ),
    );
  }

  String _mapCrownAsset(int index) {
    return switch (index) {
      0 => 'ic_crown_gold.png',
      1 => 'ic_crown_silver.png',
      2 => 'ic_crown_bronze.png',
      _ => 'ic_crown_default.png',
    };
  }
}
