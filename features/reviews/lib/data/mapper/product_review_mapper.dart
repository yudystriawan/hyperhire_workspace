import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';

@injectable
class ProductReviewMapper implements Mapper<ProductReview, ProductReviewDto> {
  @override
  ProductReview mapToEntity(ProductReviewDto model) {
    return ProductReview(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
    );
  }

  @override
  ProductReviewDto mapToModel(ProductReview entity) {
    return ProductReviewDto(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
    );
  }
}
