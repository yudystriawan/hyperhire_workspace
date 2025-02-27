part of 'top_reviewers_loader_bloc.dart';

@freezed
sealed class TopReviewersLoaderState with _$TopReviewersLoaderState {
  const factory TopReviewersLoaderState.initial() = Initial;
  const factory TopReviewersLoaderState.loadInProgress() = LoadInProgress;
  const factory TopReviewersLoaderState.loadSuccess(
    KtList<Reviewer> reviewers,
  ) = LoadSuccess;
  const factory TopReviewersLoaderState.loadFailure(ReviewFailure failure) =
      LoadFailure;
}
