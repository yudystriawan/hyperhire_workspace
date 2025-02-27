import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_dto.freezed.dart';
part 'review_dto.g.dart';

@freezed
abstract class ReviewerDto with _$ReviewerDto {
  const factory ReviewerDto({
    required String userId,
    required String content,
    required List<String> imageUrls,
    required int reviewCount,
  }) = _ReviewerDto;

  factory ReviewerDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewerDtoFromJson(json);
}

@freezed
abstract class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    required String id,
    required double rating,
    required int reviewCount,
    required ProductReviewDto product,
    required List<String> keywords,
    required List<ReviewerDto> reviewers,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}

@freezed
abstract class ProductReviewDto with _$ProductReviewDto {
  const factory ProductReviewDto({
    required String id,
    required String name,
    required String imageUrl,
  }) = _ProductReviewDto;

  factory ProductReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewDtoFromJson(json);
}
