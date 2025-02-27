import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;
  final UserMapper _userMapper;

  UserRepositoryImpl(this._userDatasource, this._userMapper);

  @override
  Future<Either<UserFailure, User>> getUserDetail(String id) async {
    try {
      final userDto = await _userDatasource.getUser(id);

      if (userDto == null) {
        return Future.value(Left(UserFailure.notFound()));
      }

      final user = _userMapper.mapToEntity(userDto);
      return right(user);
    } catch (e) {
      return left(UserFailure.unexpectedError());
    }
  }
}
