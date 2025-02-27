import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource _datasource;
  final ProductMapper _mapper;

  ProductRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<Either<ProductFailure, Product>> findById(String id) async {
    try {
      final result = await _datasource.findById(id);

      if (result == null) return left(ProductFailure.notFound());

      final product = _mapper.toEntity(result);

      return right(product);
    } catch (e) {
      debugPrint('error findById: $e');
      return left(ProductFailure.unexpectedError());
    }
  }
}
