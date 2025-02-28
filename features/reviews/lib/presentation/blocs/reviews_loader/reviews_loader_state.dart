part of 'reviews_loader_bloc.dart';

@freezed
sealed class ReviewsLoaderState with _$ReviewsLoaderState {
  const factory ReviewsLoaderState.initial() = Initial;
  const factory ReviewsLoaderState.loading() = Loading;
  const factory ReviewsLoaderState.loadSuccess(KtList<Review> reviews) =
      LoadSuccess;
  const factory ReviewsLoaderState.loadFailure(ReviewFailure failure) =
      LoadFailure;
}
