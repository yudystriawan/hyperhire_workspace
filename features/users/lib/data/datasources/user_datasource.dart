import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

abstract class UserDatasource {
  Future<UserDto?> getUser(String id);
}

@Injectable(as: UserDatasource)
class UserDatasourceImpl implements UserDatasource {
  final LocalAssetLoader db;

  UserDatasourceImpl(this.db);

  @override
  Future<UserDto?> getUser(String id) async {
    final data = await db.load('users.json');
    final users =
        (data['data'] as List).map((e) => UserDto.fromJson(e)).toList();
    final user = users.firstWhere((element) => element.id == id);
    return user;
  }
}
