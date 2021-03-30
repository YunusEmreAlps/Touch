import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveInt(String name, int text) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt(name, text);
  }

  Future<int> loadInt(String name) async {
    SharedPreferences prefs = await _prefs;
    final int stepdata = (prefs.getInt(name) ?? 0);
    if (stepdata == null) return -1;
    return stepdata;
  }

  Future<void> saveString(String name, String text) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(name, text);
  }

  Future<String> loadString(String name) async {
    SharedPreferences prefs = await _prefs;
    final String stepdata = (prefs.getString(name) ?? 0);
    if (stepdata == null) return null;
    return stepdata;
  }
}
