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
      reviewCount: model.reviewCount,
    );
  }

  @override
  ReviewerDto mapToModel(Reviewer entity) {
    return ReviewerDto(
      userId: entity.userId,
      content: entity.content,
      imageUrls: entity.imageUrls.asList(),
      reviewCount: entity.reviewCount,
    );
  }
}
