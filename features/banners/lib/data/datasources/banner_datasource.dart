import 'package:injectable/injectable.dart';

abstract class BannerDatasource {
  Future<List<String>> fetchBannerUrls();
}

@Injectable(as: BannerDatasource)
class BannerDatasourceImpl implements BannerDatasource {
  @override
  Future<List<String>> fetchBannerUrls() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      'img_banner_1.png',
      'img_banner_2.png',
      'img_banner_3.png',
      'img_banner_4.png',
    ];
  }
}
