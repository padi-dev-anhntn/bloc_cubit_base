import 'dart:ui';

import 'app_env_config.dart';

class AppConfigs {
  AppConfigs._();
  static const String appName = "Bloc cubit base";
  static Environment env = Environment.dev;

  ///API Env
  static String get baseUrl => env.baseUrl;
  static String get envName => env.envName;
  static String get httpGraphQLServiceLink => env.httpGraphQLServiceLink;

  ///Paging
  static const pageSize = 10;

  ///Local
  static const appLocal = 'vi_VN';
  static const appLanguageVi = 'vi';
  static const defaultLocal = Locale.fromSubtags(languageCode: appLanguageVi);
  static const localEn = Locale.fromSubtags(languageCode: 'en');
  static const localJa = Locale.fromSubtags(languageCode: 'ja');

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
