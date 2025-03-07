import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

part 'reviews_loader_bloc.freezed.dart';
part 'reviews_loader_event.dart';
part 'reviews_loader_state.dart';

@injectable
class ReviewsLoaderBloc extends Bloc<ReviewsLoaderEvent, ReviewsLoaderState> {
  final GetReviewsByUserIdUsecase _getReviewsByUserIdUsecase;
  final String? userId;
  ReviewsLoaderBloc(this._getReviewsByUserIdUsecase, @factoryParam this.userId)
    : super(Initial()) {
    on<_Fetched>(_onFetched);
  }

  Future<void> _onFetched(
    _Fetched event,
    Emitter<ReviewsLoaderState> emit,
  ) async {
    if (userId == null) return;
    if (state is Loading) return;

    emit(Loading());

    final failureOrReviews = await _getReviewsByUserIdUsecase(userId!);

    emit(
      failureOrReviews.fold(
        (failure) => LoadFailure(failure),
        (reviews) => LoadSuccess(reviews),
      ),
    );
  }
}
