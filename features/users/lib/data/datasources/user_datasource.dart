import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

abstract class UserDatasource {
  Future<UserDto?> getUser(String id);
}

@Injectable(as: UserDatasource)
class UserDatasourceImpl implements UserDatasource {
  @override
  Future<UserDto?> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
