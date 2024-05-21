import 'dart:ui';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SettingService extends GetxService {
  late SharedPreferences prefs;



  String? pass;
  String? userName;
  String? email;
  String? role;
  String? phone;
  bool? isLogin;
  Future<SettingService> init() async {
    prefs = await SharedPreferences.getInstance();

    /// password
    pass = prefs.getString('password');
    phone = prefs.getString("phone");
    userName = prefs.getString("userName");
    isLogin = prefs.getBool("rememberAccount");
    ///Language
    String languageCode = prefs.getString("languageCode") ?? 'vi';


    return this;
  }

  Future<void> rememberAccount(bool isLogin) async {
    await prefs.setBool('rememberAccount', isLogin);
    isLogin = isLogin;
  }

  Future<void> saveUser(String password) async {
    await prefs.setString('password', password);
    pass = password;
  }

  // void updateLocale(Locale locale) async {
  //   var newLocale = S.delegate.supportedLocales.firstWhere(
  //         (element) => element.languageCode == locale.languageCode,
  //     orElse: () => const Locale.fromSubtags(languageCode: "en"),
  //   );
  //   await prefs.setString('languageCode', newLocale.languageCode);
  //   currentLocate.value = newLocale;
  //   await Get.updateLocale(newLocale);
  // }
}
