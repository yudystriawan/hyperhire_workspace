import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

@injectable
class GetProductUsecase implements Usecase<ProductFailure, Product, String> {
  final ProductRepository _repository;

  GetProductUsecase(this._repository);

  @override
  Future<Either<ProductFailure, Product>> call(String id) {
    return _repository.findById(id);
  }
}
