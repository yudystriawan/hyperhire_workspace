import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:reviews/reviews.dart';

@injectable
class GetTop3ProductsUsecase
    implements NoParamsUsecase<ReviewFailure, KtList<Review>> {
  final ReviewRepository _repository;

  GetTop3ProductsUsecase(this._repository);

  @override
  Future<Either<ReviewFailure, KtList<Review>>> call() {
    return _repository.getTop3Products();
  }
}
