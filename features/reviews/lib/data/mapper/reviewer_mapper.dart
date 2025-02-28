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
      pros: model.pros?.toImmutableList() ?? emptyList(),
      cons: model.cons?.toImmutableList() ?? emptyList(),
      imageUrls: model.imageUrls?.toImmutableList() ?? emptyList(),
      score: model.score ?? 0.0,
      createdAt: model.createdAt ?? DateTime.now(),
    );
  }

  @override
  ReviewerDto mapToModel(Reviewer entity) {
    return ReviewerDto(
      user: _userReviewMapper.mapToModel(entity.user),
      pros: entity.pros.asList(),
      cons: entity.cons.asList(),
      imageUrls: entity.imageUrls.asList(),
      score: entity.score,
      createdAt: entity.createdAt,
    );
  }
}
