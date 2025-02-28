import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(ignoreUnregisteredTypes: [LocalAssetLoader])
void initMicroPackage() {}
