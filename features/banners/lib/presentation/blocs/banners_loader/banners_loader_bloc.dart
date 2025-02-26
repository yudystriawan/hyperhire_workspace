import 'package:banners/banners.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'banners_loader_bloc.freezed.dart';
part 'banners_loader_event.dart';
part 'banners_loader_state.dart';

@injectable
class BannersLoaderBloc extends Bloc<BannersLoaderEvent, BannersLoaderState> {
  final GetBannerUrlsUsecase _getBannerUrlsUsecase;

  BannersLoaderBloc(this._getBannerUrlsUsecase)
    : super(BannersLoaderState.initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(_Fetched event, Emitter<BannersLoaderState> emit) async {
    if (state == BannersLoaderState.loadInProgress()) return;

    emit(BannersLoaderState.loadInProgress());

    final failureOrSuccess = await _getBannerUrlsUsecase();

    emit(
      failureOrSuccess.fold(
        (failure) => BannersLoaderState.loadFailure(failure),
        (urls) => BannersLoaderState.loadSuccess(urls),
      ),
    );
  }
}
