part of 'top_reviewers_loader_bloc.dart';

@freezed
sealed class TopReviewersLoaderEvent with _$TopReviewersLoaderEvent {
  const factory TopReviewersLoaderEvent.fetched() = _Fetched;
}
