import 'package:freezed_annotation/freezed_annotation.dart';

part 'tier.freezed.dart';

@freezed
sealed class UserTier with _$UserTier {
  const factory UserTier.bronze() = Bronze;
  const factory UserTier.silver() = Silver;
  const factory UserTier.gold() = Gold;
}

extension UserTierX on UserTier {
  String get name {
    return switch (this) {
      Gold() => '골드',
      Bronze() => '브론즈',
      Silver() => '실버',
    };
  }
}
