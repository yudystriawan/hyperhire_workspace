import 'package:products/products.dart';

abstract class ProductRepository {
  Future<Product> findById(String id);
}
