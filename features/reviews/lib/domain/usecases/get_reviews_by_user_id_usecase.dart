import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:reviews/reviews.dart';

@injectable
class GetReviewsByUserIdUsecase
    implements Usecase<ReviewFailure, KtList<Review>, String> {
  final ReviewRepository _repository;

  GetReviewsByUserIdUsecase(this._repository);

  @override
  Future<Either<ReviewFailure, KtList<Review>>> call(String params) {
    return _repository.getReviewsByUserId(params);
  }
}
