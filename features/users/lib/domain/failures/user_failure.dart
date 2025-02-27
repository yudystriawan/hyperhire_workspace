import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@freezed
sealed class UserFailure with _$UserFailure {
  const factory UserFailure.unexpectedError() = UnexpectedError;
  const factory UserFailure.notFound() = NotFound;
}
