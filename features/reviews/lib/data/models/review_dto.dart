import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_dto.freezed.dart';
part 'review_dto.g.dart';

@freezed
abstract class ReviewerDto with _$ReviewerDto {
  const factory ReviewerDto({
    required String userId,
    required String content,
    required List<String> imageUrls,
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
    required String productId,
    required List<String> keywords,
    required List<ReviewerDto> reviewers,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}
