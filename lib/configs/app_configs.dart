import 'dart:ui';

import 'app_env_config.dart';

class AppConfigs {
  AppConfigs._();
  static const String appName = "Bloc cubit base";
  static Environment env = Environment.prod;

  ///API Env
  static String get baseUrl => env.baseUrl;
  static String get envName => env.envName;

  ///Paging
  static const pageSize = 10;

  ///Local
  static const appLocal = 'vi_VN';
  static const appLanguage = 'vi';
  static const defaultLocal = Locale.fromSubtags(languageCode: appLanguage);

  ///DateFormat
  static const dateDisplayFormat = 'dd/MM/yyyy';
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Font
  // static const fontFamily = 'Roboto';
}

class DatabaseConfig {
  ///TODO
  static const String apiKey = 'todo';

  static const int version = 1;
}
