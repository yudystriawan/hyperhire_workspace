import 'package:dartz/dartz.dart';
import 'package:products/products.dart';

abstract class ProductRepository {
  Future<Either<ProductFailure, Product>> findById(String id);
}
