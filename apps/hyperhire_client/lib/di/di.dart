import 'package:banners/banners.dart';
import 'package:core/core.dart';
import 'package:hyperhire_client/di/di.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  externalPackageModulesAfter: [ExternalModule(BannersPackageModule)],
)
Future<void> configureDependencies() => getIt.init();
