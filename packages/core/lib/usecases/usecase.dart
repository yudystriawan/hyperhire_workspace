part of '../core.dart';

abstract class Usecase<L, R, Params> {
  Future<Either<L, R>> call(Params id);
}

abstract class NoParamsUsecase<L, R> {
  Future<Either<L, R>> call();
}
