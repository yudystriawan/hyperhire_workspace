part of '../databases.dart';

class LocalAssetLoader {
  Future<Map<String, dynamic>> load(String path) async {
    final jsonString = await rootBundle.loadString(
      'packages/databases/assets/json/$path',
    );
    final data = jsonDecode(jsonString);
    return data;
  }
}
