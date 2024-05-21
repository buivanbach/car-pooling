import 'package:get/get.dart';
import 'package:rc_fl_gopoolar/data/local/preference/preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManagerImpl extends GetxService implements PreferenceManager {
  late SharedPreferences _preference;

  Future<PreferenceManagerImpl> init() async {
    _preference = await SharedPreferences.getInstance();
    return this;
  }

  @override
  String getString(String key, {String defaultValue = ""}) {
    return _preference.getString(key) ?? defaultValue;
  }

  @override
  Future<bool> setString(String key, String value) async {
    return _preference.setString(key, value);
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return _preference.getInt(key) ?? defaultValue;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return _preference.setInt(key, value);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preference.getDouble(key) ?? defaultValue;
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _preference.setDouble(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return _preference.getBool(key) ?? defaultValue;
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _preference.setBool(key, value);
  }

  @override
  List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return _preference.getStringList(key) ?? defaultValue;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _preference.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) {
    return _preference.remove(key);
  }

  @override
  Future<bool> clear() {
    return _preference.clear();
  }
}
