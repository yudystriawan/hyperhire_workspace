import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:users/users.dart';

@injectable
class GetUserDetailUsecase implements Usecase<UserFailure, User, String> {
  final UserRepository _repository;

  GetUserDetailUsecase(this._repository);
  @override
  Future<Either<UserFailure, User>> call(String id) {
    return _repository.getUserDetail(id);
  }
}
