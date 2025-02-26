import 'package:banners/banners.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@Injectable(as: BannerRepository)
class BannerRepositoryImpl implements BannerRepository {
  final BannerDatasource _datasource;

  BannerRepositoryImpl(this._datasource);

  @override
  Future<Either<BannerFailure, KtList<String>>> fetchBannerUrls() async {
    try {
      final urls = await _datasource.fetchBannerUrls();

      return right(KtList.from(urls));
    } catch (e) {
      debugPrint('error: $e');
      return left(BannerFailure.unexpectedError());
    }
  }
}
