import 'package:databases/databases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  Isar get db => IsarDB.instance;
}
