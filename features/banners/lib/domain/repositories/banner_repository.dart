import 'package:banners/banners.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class BannerRepository {
  Future<Either<BannerFailure, KtList<String>>> fetchBannerUrls();
}
