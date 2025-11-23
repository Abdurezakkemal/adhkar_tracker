import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _countKeyPrefix = 'count_';

  String _getTodayKey() {
    final now = DateTime.now();
    return '$_countKeyPrefix${now.year}-${now.month}-${now.day}';
  }

  Future<void> saveCount(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_getTodayKey(), count);
  }

  Future<int> loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_getTodayKey()) ?? 0;
  }

  Future<Map<String, int>> getAllCounts() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where(
      (key) => key.startsWith(_countKeyPrefix),
    );
    final Map<String, int> counts = {};
    for (final key in keys) {
      counts[key.replaceFirst(_countKeyPrefix, '')] = prefs.getInt(key) ?? 0;
    }
    return counts;
  }
}
