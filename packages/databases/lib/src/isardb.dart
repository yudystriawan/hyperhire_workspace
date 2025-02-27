part of '../databases.dart';

class IsarDB {
  static final IsarDB _singleton = IsarDB._internal();
  static Isar? _db;

  factory IsarDB() {
    return _singleton;
  }

  IsarDB._internal();

  static Future<void> initialize(
    List<CollectionSchema<dynamic>> schemas,
  ) async {
    final dir = await getApplicationDocumentsDirectory();
    if (dir.existsSync()) {
      _db = await Isar.open(schemas, directory: dir.path);
    }
  }

  static Isar get instance {
    if (_db == null) {
      throw Exception(
        'IsarDB is not initialized. Please run initialize first.',
      );
    }
    return _db!;
  }
}
