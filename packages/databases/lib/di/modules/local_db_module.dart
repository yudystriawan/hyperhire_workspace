import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocalDBModule {
  @lazySingleton
  LocalAssetLoader get userDb => LocalAssetLoader();
}
