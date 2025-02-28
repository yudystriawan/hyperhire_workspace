import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'review.freezed.dart';

@freezed
abstract class Review with _$Review {
  const Review._();

  const factory Review({
    required String id,
    required double rating,
    required int reviewCount,
    required ProductReview product,
    required KtList<String> keywords,
    required KtList<Reviewer> reviewers,
  }) = _Review;

  KtList<String> get getAllReviewContent =>
      reviewers.flatMap((reviewer) => reviewer.pros + reviewer.cons);
}

@freezed
abstract class Reviewer with _$Reviewer {
  const factory Reviewer({
    required UserReview user,
    required KtList<String> pros,
    required KtList<String> cons,
    required KtList<String> imageUrls,
    required double score,
    required DateTime createdAt,
  }) = _Reviewer;
}

@freezed
abstract class ProductReview with _$ProductReview {
  const factory ProductReview({
    required String id,
    required String name,
    required String imageUrl,
  }) = _ProductReview;
}

@freezed
abstract class UserReview with _$UserReview {
  const factory UserReview({
    required String id,
    required String name,
    required String profileImageUrl,
    required int reviewCount,
  }) = _UserReview;
}
