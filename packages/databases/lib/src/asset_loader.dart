part of '../databases.dart';

class LocalAssetLoader {
  static Future<Map<dynamic, String>> load(String path) async {
    final jsonString = await rootBundle.loadString('assets/json/$path');
    final data = jsonDecode(jsonString);
    return data;
  }
}
