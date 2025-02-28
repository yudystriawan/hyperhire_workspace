import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';

abstract class ReviewDatasource {
  Future<List<ReviewDto>> getTop3Products();
  Future<List<ReviewerDto>> getTop10Reviewers();
  Future<List<ReviewDto>> getReviewsByUserId(String userId);
}

@Injectable(as: ReviewDatasource)
class ReviewDatasourceImpl implements ReviewDatasource {
  final LocalAssetLoader _db;

  ReviewDatasourceImpl(this._db);

  @override
  Future<List<ReviewerDto>> getTop10Reviewers() async {
    try {
      final data = await _db.load('reviewers.json');
      final reviewers =
          (data['data'] as List).map((e) => ReviewerDto.fromJson(e)).toList();
      reviewers.sort(
        (a, b) => b.user.reviewCount.compareTo(a.user.reviewCount),
      );
      return reviewers;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ReviewDto>> getTop3Products() async {
    try {
      final data = await _db.load('reviews.json');
      final reviews =
          (data['data'] as List).map((e) => ReviewDto.fromJson(e)).toList();
      reviews.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
      return reviews.take(3).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ReviewDto>> getReviewsByUserId(String userId) async {
    try {
      final data = await _db.load('reviews.json');
      final reviews =
          (data['data'] as List).map((e) => ReviewDto.fromJson(e)).toList();
      return reviews
          .where((e) => e.reviewers.any((r) => r.user.id == userId))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
