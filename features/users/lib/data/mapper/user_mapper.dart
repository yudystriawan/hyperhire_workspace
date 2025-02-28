import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

@injectable
class UserMapper implements Mapper<User, UserDto> {
  @override
  User mapToEntity(UserDto model) {
    return User(
      id: model.id,
      imageUrl: model.imageUrl,
      name: model.name,
      tier: switch (model.tier) {
        'bronze' => UserTier.bronze(),
        'silver' => UserTier.silver(),
        'gold' => UserTier.gold(),
        _ => throw Exception('Invalid tier'),
      },
      description: model.description,
    );
  }

  @override
  UserDto mapToModel(User entity) {
    return UserDto(
      id: entity.id,
      imageUrl: entity.imageUrl,
      name: entity.name,
      tier: switch (entity.tier) {
        Bronze() => 'bronze',
        Silver() => 'silver',
        Gold() => 'gold',
      },
      description: entity.description,
    );
  }
}
