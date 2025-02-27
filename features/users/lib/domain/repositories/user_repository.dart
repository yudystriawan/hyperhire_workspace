import 'package:dartz/dartz.dart';
import 'package:users/users.dart';

abstract class UserRepository {
  Future<Either<UserFailure, User>> getUserDetail(String id);
}
