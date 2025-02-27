import 'package:injectable/injectable.dart';
import 'package:products/products.dart';

@injectable
class ProductMapper {
  Product toEntity(ProductDto dto) {
    return Product(id: dto.id, imageUrl: dto.imageUrl, title: dto.title);
  }

  ProductDto toModel(Product entity) {
    return ProductDto(
      id: entity.id,
      imageUrl: entity.imageUrl,
      title: entity.title,
    );
  }
}
