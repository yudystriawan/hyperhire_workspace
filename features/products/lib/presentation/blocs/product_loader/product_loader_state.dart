part of 'product_loader_bloc.dart';

@freezed
sealed class ProductLoaderState with _$ProductLoaderState {
  const factory ProductLoaderState.initial() = _Initial;
  const factory ProductLoaderState.loadInProgress() = _LoadInProgress;
  const factory ProductLoaderState.loadSuccess(Product product) = _LoadSuccess;
  const factory ProductLoaderState.loadFailure(ProductFailure failure) =
      _LoadFailure;
}
