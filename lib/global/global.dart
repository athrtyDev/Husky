import 'package:diyi/core/classes/AppStaticData.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'style.dart';

Globals app = Globals();

class Globals {
  static Globals _instance = Globals();
  AppStaticData? appStaticData;
  bool? isReviewingVersion;
  late SharedPreferences cacheStorage;

  factory Globals() {
    _instance = Globals._internal();
    return _instance;
  }

  Globals._internal() {
    _init();
  }

  void _init() async {
    cacheStorage = await SharedPreferences.getInstance();
  }

  void writeStorage(String key, dynamic value) async {
    cacheStorage.setString(key, value);
  }

  Future<String?> getStorage(String key) async {
    if (cacheStorage.containsKey(key)) {
      return cacheStorage.getString(key);
    } else {
      return null;
    }
  }

  Future<void> removeStorage(String key) async {
    if (cacheStorage.containsKey(key)) {
      await cacheStorage.remove(key);
    }
  }
}
