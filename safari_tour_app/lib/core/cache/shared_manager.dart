import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { access, refresh }

class SharedManager {
  SharedPreferences? preferences;
  SharedManager();
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(SharedKeys key, String value) async {
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    return (await preferences?.remove(key.name)) ?? false;
  }
}
