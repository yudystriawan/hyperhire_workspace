import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

part 'top_products_loader_bloc.freezed.dart';
part 'top_products_loader_event.dart';
part 'top_products_loader_state.dart';

@injectable
class TopProductsLoaderBloc
    extends Bloc<TopProductsLoaderEvent, TopProductsLoaderState> {
  final GetTop3ProductsUsecase _getTop3ProductsUsecase;

  TopProductsLoaderBloc(this._getTop3ProductsUsecase) : super(_Initial()) {
    on<_Fetched>(_onFetched);
  }

  void _onFetched(_Fetched event, Emitter<TopProductsLoaderState> emit) async {
    if (state == _LoadInProgress()) return;

    emit(_LoadInProgress());

    final failureOrSuccess = await _getTop3ProductsUsecase();

    emit(
      failureOrSuccess.fold(
        (failure) => _LoadFailure(failure),
        (products) => _LoadSuccess(products),
      ),
    );
  }
}
