import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:reviews/reviews.dart';

abstract class ReviewRepository {
  Future<Either<ReviewFailure, KtList<Review>>> getTop3Products();
  Future<Either<ReviewFailure, KtList<Review>>> getTop10Reviewers();
}
