import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../preference/preference_manager.dart';



class AuthService extends GetxService {
  // Rxn<UserInfo> userInfo = Rxn<UserInfo>();

  final PreferenceManager _preferenceManager = Get.find(tag: (PreferenceManager).toString());

  late SharedPreferences prefs;

  Future<AuthService> init() async {
    prefs = await SharedPreferences.getInstance();
    //await getAuth();
    return this;
  }

  Future<void> setRememberAccount(bool isLogin) async {
    try {
      await _preferenceManager.setBool(PreferenceManager.rememberAccount, isLogin);
    } catch (e) {
      Logger().e(e.toString());
      throw Exception();
    }
  }

  String? getUserName() {
    final userName = _preferenceManager.getString(PreferenceManager.userName);
    return userName;
  }

  String? getPassword() {
    return _preferenceManager.getString(PreferenceManager.password);
  }
  String? getPhone() {
    return _preferenceManager.getString(PreferenceManager.phone);
  }
  String? getEmail() {
    return _preferenceManager.getString(PreferenceManager.password);
  }
  void clearPassWord() {
    _preferenceManager.remove(PreferenceManager.password);
  }

  bool rememberAccount() {
    return _preferenceManager.getBool(PreferenceManager.rememberAccount);
  }

  Future<void> saveUser(String user) async {
    try {
      await _preferenceManager.setString(PreferenceManager.userName, user);
    } catch (e) {
      Logger().e(e.toString());
      throw Exception();
    }
  }

  Future<void> savePass(String pass) async {
    try {
      await _preferenceManager.setString(PreferenceManager.password, pass);
    } catch (e) {
      Logger().e(e.toString());
      throw Exception();
    }
  }

  // Future<void> getAuth() async {
  //   final currentTokenString = _preferenceManager.getString(PreferenceManager.userEntity);
  //   if (currentTokenString.isNotEmpty) {
  //     userInfo.value = UserInfo.fromJson(jsonDecode(currentTokenString));
  //   }
  // }

  /// Handle save/remove Token
  // Future<void> saveUserInfo(UserInfo user) async {
  //   try {
  //     userInfo.value = user;
  //     await _preferenceManager.setString(PreferenceManager.userEntity, jsonEncode(userInfo.value?.toJson()));
  //   } catch (e) {
  //     Logger().e(e.toString());
  //     throw Exception();
  //   }
  // }

  // Future<void> saveToken(TokenEntity _token) async {
  //   try {
  //     await _preferenceManager.setString(PreferenceManager.keyToken, _token.token);
  //   } catch (e) {
  //     Logger().e(e.toString());
  //     throw Exception();
  //   }
  // }

  // static Future<void> removeAll() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File(directory.path);
  //   final isExists = await file.exists();
  //   if (isExists) {
  //     await file.delete(recursive: true);
  //   }
  // }

  Future<bool> removeUserName() {
    return _preferenceManager.remove(PreferenceManager.userName);
  }

  Future<bool> removeEmail() {
    return _preferenceManager.remove(PreferenceManager.email);
  }
  Future<bool> removePhone() {
    return _preferenceManager.remove(PreferenceManager.phone);
  }
  /// SignOut
  Future<void> signOut() async {
    setRememberAccount(false);
    removeUserName();
    removeEmail();
    removePhone();
  }
}
