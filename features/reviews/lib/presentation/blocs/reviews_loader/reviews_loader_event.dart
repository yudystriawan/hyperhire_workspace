part of 'reviews_loader_bloc.dart';

@freezed
sealed class ReviewsLoaderEvent with _$ReviewsLoaderEvent {
  const factory ReviewsLoaderEvent.fetched() = _Fetched;
}
