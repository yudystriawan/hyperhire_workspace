import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users/users.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String imageUrl,
    required String name,
    required UserTier tier,
    required String description,
  }) = _User;
}
