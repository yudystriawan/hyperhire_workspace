part of '../core.dart';

abstract class Usecase<L, R> {
  Future<Either<L, R>> call();
}
