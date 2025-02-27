import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_failure.freezed.dart';

@freezed
sealed class ProductFailure with _$ProductFailure {
  const factory ProductFailure.unexpectedError() = UnexpectedError;
  const factory ProductFailure.notFound() = NotFound;
}
