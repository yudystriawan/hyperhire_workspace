import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';

@injectable
class UserReviewMapper implements Mapper<UserReview, UserReviewDto> {
  @override
  UserReview mapToEntity(UserReviewDto model) {
    return UserReview(
      id: model.id,
      name: model.name,
      profileImageUrl: model.profileImageUrl,
    );
  }

  @override
  UserReviewDto mapToModel(UserReview entity) {
    return UserReviewDto(
      id: entity.id,
      name: entity.name,
      profileImageUrl: entity.profileImageUrl,
    );
  }
}
