import 'package:databases/databases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@Collection(ignore: {'copyWith'})
@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String imageUrl,
    required String title,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
