import 'package:banners/banners.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

class GetBannerUrlsUsecase implements Usecase<BannerFailure, KtList<String>> {
  final BannerRepository _repository;

  GetBannerUrlsUsecase(this._repository);

  @override
  Future<Either<BannerFailure, KtList<String>>> call() {
    return _repository.fetchBannerUrls();
  }
}
