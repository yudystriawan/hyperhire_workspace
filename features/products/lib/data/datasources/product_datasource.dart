import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

abstract class ProductDatasource {
  Future<ProductDto?> findById(String id);
}

@Injectable(as: ProductDatasource)
class ProductDatasourceImpl implements ProductDatasource {
  @override
  Future<ProductDto?> findById(String id) {
    throw UnimplementedError();
  }
}
