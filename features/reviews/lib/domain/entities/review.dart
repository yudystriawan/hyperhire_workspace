import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'review.freezed.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required double rating,
    required int reviewCount,
    required ProductReview product,
    required KtList<String> keywords,
    required KtList<Reviewer> reviewers,
  }) = _Review;
}

@freezed
abstract class Reviewer with _$Reviewer {
  const factory Reviewer({
    required UserReview user,
    required String content,
    required KtList<String> imageUrls,
    required int reviewCount,
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
  }) = _UserReview;
}
