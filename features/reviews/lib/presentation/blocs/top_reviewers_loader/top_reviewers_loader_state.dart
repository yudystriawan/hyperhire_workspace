part of 'top_reviewers_loader_bloc.dart';

@freezed
sealed class TopReviewersLoaderState with _$TopReviewersLoaderState {
  const factory TopReviewersLoaderState.initial() = _Initial;
  const factory TopReviewersLoaderState.loadInProgress() = _LoadInProgress;
  const factory TopReviewersLoaderState.loadSuccess(
    KtList<Reviewer> reviewers,
  ) = _LoadSuccess;
  const factory TopReviewersLoaderState.loadFailure(ReviewFailure failure) =
      _LoadFailure;
}
