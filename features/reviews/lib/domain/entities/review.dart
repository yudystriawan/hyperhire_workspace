import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'review.freezed.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required double rating,
    required int reviewCount,
    required String productId,
    required KtList<String> keywords,
    required KtList<Reviewer> reviewers,
  }) = _Review;
}

@freezed
abstract class Reviewer with _$Reviewer {
  const factory Reviewer({
    required String userId,
    required String content,
    required KtList<String> imageUrls,
  }) = _Reviewer;
}
