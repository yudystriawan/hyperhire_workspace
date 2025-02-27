part of 'top_products_loader_bloc.dart';

@freezed
sealed class TopProductsLoaderState with _$TopProductsLoaderState {
  const factory TopProductsLoaderState.initial() = _Initial;
  const factory TopProductsLoaderState.loadInProgress() = _LoadInProgress;
  const factory TopProductsLoaderState.loadSuccess(KtList<Review> reviews) =
      _LoadSuccess;
  const factory TopProductsLoaderState.loadFailure(ReviewFailure failure) =
      _LoadFailure;
}
