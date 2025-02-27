part of 'product_loader_bloc.dart';

@freezed
sealed class ProductLoaderEvent with _$ProductLoaderEvent {
  const factory ProductLoaderEvent.fetched(String id) = _Fetched;
}
