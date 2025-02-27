import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocalDBModule {
  LocalAssetLoader get localAssetLoader => LocalAssetLoader();
}
