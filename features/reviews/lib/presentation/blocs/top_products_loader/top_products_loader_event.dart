part of 'top_products_loader_bloc.dart';

@freezed
sealed class TopProductsLoaderEvent with _$TopProductsLoaderEvent {
  const factory TopProductsLoaderEvent.fetched() = _Fetched;
}
