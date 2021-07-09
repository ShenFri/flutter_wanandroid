import 'package:flutter/foundation.dart';

class Constant {
  static const String keyLanguage = 'key_language';

  static const int status_success = 0;

  static const String server_address = kDebugMode ? test_url :product_url;

  static const String wan_android = "https://www.wanandroid.com/";
  static const String test_url = "http://192.168.10.125:8088/tpos-api-web-srv/";
  static const String product_url = "https://api.nblklpay.com/tpos-api-web-srv/";

  static const int type_sys_update = 1;
  static const int type_refresh_all = 5;

  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
  static const String accountType = '2';//商客宝 2 / 商客家 1
  static const String sp_token = 'sp_token';
}

class AppConfig {
  static const String appId = 'com.lkl.tpos.agent';
  static const String appName = isDebug ? '商客宝测试版':'商客宝';
  static const String version = '1.0.1';
  static const bool isDebug = kDebugMode;
}

class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}
