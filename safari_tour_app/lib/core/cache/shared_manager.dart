import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { access, refresh }

class SharedManager {
  SharedManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }

  static final SharedManager _instance = SharedManager._init();

  SharedPreferences? _preferences;
  static SharedManager get instance => _instance;
  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setString(SharedKeys key, String value) async {
    await _preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    return _preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await _preferences?.remove(key.name)) ?? false;
  }
}
