import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

@injectable
class ReviewerMapper implements Mapper<Reviewer, ReviewerDto> {
  @override
  Reviewer mapToEntity(ReviewerDto model) {
    return Reviewer(
      userId: model.userId,
      content: model.content,
      imageUrls: model.imageUrls.toImmutableList(),
    );
  }

  @override
  ReviewerDto mapToModel(Reviewer entity) {
    return ReviewerDto(
      userId: entity.userId,
      content: entity.content,
      imageUrls: entity.imageUrls.asList(),
    );
  }
}

@injectable
class ReviewMapper implements Mapper<Review, ReviewDto> {
  final ReviewerMapper _reviewerMapper;

  ReviewMapper(this._reviewerMapper);

  @override
  Review mapToEntity(ReviewDto model) {
    return Review(
      id: model.id,
      rating: model.rating,
      reviewCount: model.reviewCount,
      productId: model.productId,
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
      productId: entity.productId,
      keywords: entity.keywords.asList(),
      reviewers:
          entity.reviewers
              .map((reviewer) => _reviewerMapper.mapToModel(reviewer))
              .asList(),
    );
  }
}
