import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

abstract class ProductDatasource {
  Future<ProductDto?> findById(String id);
}

@Injectable(as: ProductDatasource)
class ProductDatasourceImpl implements ProductDatasource {
  @override
  Future<ProductDto?> findById(String id) {
    return Future.value(_products.firstWhere((element) => element.id == id));
  }
}

final _products = [
  ProductDto(
    id: '1',
    imageUrl: 'img_product_1.png',
    title: 'LG전자 스탠바이미 27ART10AKPL (스탠드)',
  ),
  ProductDto(
    id: '2',
    imageUrl: 'img_product_2.png',
    title: 'LG전자  울트라HD 75UP8300KNA (스탠드)',
  ),
  ProductDto(
    id: '3',
    imageUrl: 'img_product_3.png',
    title: '라익미 스마트 DS4001L NETRANGE (스탠드)GX30K WIN10 (SSD 256GB)',
  ),
];
