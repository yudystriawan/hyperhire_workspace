import 'package:banners/banners.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@injectable
class GetBannerUrlsUsecase
    implements NoParamsUsecase<BannerFailure, KtList<String>> {
  final BannerRepository _repository;

  GetBannerUrlsUsecase(this._repository);

  @override
  Future<Either<BannerFailure, KtList<String>>> call() {
    return _repository.fetchBannerUrls();
  }
}
