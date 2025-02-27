import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:reviews/reviews.dart';

part 'top_reviewers_loader_bloc.freezed.dart';
part 'top_reviewers_loader_event.dart';
part 'top_reviewers_loader_state.dart';

@injectable
class TopReviewersLoaderBloc
    extends Bloc<TopReviewersLoaderEvent, TopReviewersLoaderState> {
  final GetTop10ReviewersUsecase _getTop10ReviewersUsecase;

  TopReviewersLoaderBloc(this._getTop10ReviewersUsecase) : super(Initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(_Fetched event, Emitter<TopReviewersLoaderState> emit) async {
    if (state == LoadInProgress()) return;

    emit(LoadInProgress());

    final failureOrSuccess = await _getTop10ReviewersUsecase();

    emit(
      failureOrSuccess.fold(
        (failure) => LoadFailure(failure),
        (reviewers) => LoadSuccess(reviewers),
      ),
    );
  }
}
