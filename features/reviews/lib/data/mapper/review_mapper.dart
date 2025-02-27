import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

@injectable
class ReviewMapper implements Mapper<Review, ReviewDto> {
  final ReviewerMapper _reviewerMapper;
  final ProductReviewMapper _productReviewMapper;

  ReviewMapper(this._reviewerMapper, this._productReviewMapper);

  @override
  Review mapToEntity(ReviewDto model) {
    return Review(
      id: model.id,
      rating: model.rating,
      reviewCount: model.reviewCount,
      product: _productReviewMapper.mapToEntity(model.product),
      keywords: model.keywords.toImmutableList(),
      reviewers:
          model.reviewers
              .map((reviewer) => _reviewerMapper.mapToEntity(reviewer))
              .toImmutableList(),
    );
  }

  @override
  ReviewDto mapToModel(Review entity) {
    return ReviewDto(
      id: entity.id,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
      product: _productReviewMapper.mapToModel(entity.product),
      keywords: entity.keywords.asList(),
      reviewers:
          entity.reviewers
              .map((reviewer) => _reviewerMapper.mapToModel(reviewer))
              .asList(),
    );
  }
}
