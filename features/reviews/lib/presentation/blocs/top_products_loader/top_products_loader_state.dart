part of 'top_products_loader_bloc.dart';

@freezed
sealed class TopProductsLoaderState with _$TopProductsLoaderState {
  const factory TopProductsLoaderState.initial() = Initial;
  const factory TopProductsLoaderState.loadInProgress() = LoadInProgress;
  const factory TopProductsLoaderState.loadSuccess(KtList<Review> reviews) =
      LoadSuccess;
  const factory TopProductsLoaderState.loadFailure(ReviewFailure failure) =
      LoadFailure;
}
