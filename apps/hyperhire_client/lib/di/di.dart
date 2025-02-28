import 'package:banners/banners.dart';
import 'package:core/core.dart';
import 'package:hyperhire_client/di/di.config.dart';
import 'package:injectable/injectable.dart';
import 'package:reviews/reviews.dart';
import 'package:users/users.dart';

@InjectableInit(
  externalPackageModulesAfter: [
    ExternalModule(BannersPackageModule),
    ExternalModule(ReviewsPackageModule),
    ExternalModule(UsersPackageModule),
  ],
)
Future<void> configureDependencies() => getIt.init();
