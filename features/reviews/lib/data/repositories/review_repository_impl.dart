import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

@Injectable(as: ReviewRepository)
class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDatasource _datasource;
  final ReviewMapper _reviewMapper;
  final ReviewerMapper _reviewerMapper;

  ReviewRepositoryImpl(
    this._datasource,
    this._reviewMapper,
    this._reviewerMapper,
  );

  @override
  Future<Either<ReviewFailure, KtList<Reviewer>>> getTop10Reviewers() async {
    try {
      final result = await _datasource.getTop10Reviewers();
      return right(
        result.map((dto) => _reviewerMapper.mapToEntity(dto)).toImmutableList(),
      );
    } catch (e) {
      return left(const ReviewFailure.unexpectedError());
    }
  }

  @override
  Future<Either<ReviewFailure, KtList<Review>>> getTop3Products() async {
    try {
      final result = await _datasource.getTop3Products();
      return right(
        result.map((dto) => _reviewMapper.mapToEntity(dto)).toImmutableList(),
      );
    } catch (e) {
      return left(const ReviewFailure.unexpectedError());
    }
  }

  @override
  Future<Either<ReviewFailure, KtList<Review>>> getReviewsByUserId(
    String userId,
  ) async {
    try {
      final result = await _datasource.getReviewsByUserId(userId);
      return right(
        result.map((dto) => _reviewMapper.mapToEntity(dto)).toImmutableList(),
      );
    } catch (e) {
      return left(const ReviewFailure.unexpectedError());
    }
  }
}
