import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

class GetTop10ReviewersUsecase
    implements NoParamsUsecase<ReviewFailure, KtList<Reviewer>> {
  final ReviewRepository _repository;

  GetTop10ReviewersUsecase(this._repository);

  @override
  Future<Either<ReviewFailure, KtList<Reviewer>>> call() {
    return _repository.getTop10Reviewers();
  }
}
