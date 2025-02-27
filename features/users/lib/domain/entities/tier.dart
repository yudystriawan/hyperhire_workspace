import 'package:freezed_annotation/freezed_annotation.dart';

part 'tier.freezed.dart';

@freezed
class UserTier with _$UserTier {
  const factory UserTier.bronze() = Bronze;
  const factory UserTier.silver() = Silver;
  const factory UserTier.gold() = Gold;
}
