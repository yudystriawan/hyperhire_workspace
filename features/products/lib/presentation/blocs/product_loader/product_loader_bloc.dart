import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

part 'product_loader_bloc.freezed.dart';
part 'product_loader_event.dart';
part 'product_loader_state.dart';

@injectable
class ProductLoaderBloc extends Bloc<ProductLoaderEvent, ProductLoaderState> {
  final GetProductUsecase _getProductUsecase;

  ProductLoaderBloc(this._getProductUsecase)
    : super(ProductLoaderState.initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(_Fetched event, Emitter<ProductLoaderState> emit) async {
    if (state is _LoadInProgress) return;

    emit(ProductLoaderState.loadInProgress());

    final failureOrProduct = await _getProductUsecase(event.id);

    emit(
      failureOrProduct.fold(
        (failure) => ProductLoaderState.loadFailure(failure),
        (product) => ProductLoaderState.loadSuccess(product),
      ),
    );
  }
}
