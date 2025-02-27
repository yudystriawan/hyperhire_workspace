import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

@injectable
class ReviewerMapper implements Mapper<Reviewer, ReviewerDto> {
  final UserReviewMapper _userReviewMapper;

  ReviewerMapper(this._userReviewMapper);

  @override
  Reviewer mapToEntity(ReviewerDto model) {
    return Reviewer(
      user: _userReviewMapper.mapToEntity(model.user),
      content: model.content,
      imageUrls: model.imageUrls.toImmutableList(),
      reviewCount: model.reviewCount,
    );
  }

  @override
  ReviewerDto mapToModel(Reviewer entity) {
    return ReviewerDto(
      user: _userReviewMapper.mapToModel(entity.user),
      content: entity.content,
      imageUrls: entity.imageUrls.asList(),
      reviewCount: entity.reviewCount,
    );
  }
}
