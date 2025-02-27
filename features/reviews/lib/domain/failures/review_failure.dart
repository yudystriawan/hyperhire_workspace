import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_failure.freezed.dart';

@freezed
sealed class ReviewFailure with _$ReviewFailure {
  const factory ReviewFailure.unexpectedError() = UnecpectedError;
}
