import 'package:ecommerce/src/app_config/imports/import.dart';

abstract class AppEnvironment {
  static late String baseUrl;
  static late String title;
  static late bool debugBanner;
  static late Environment _environment;
  static late Color statusBarColor;
  static late Brightness statusBarIconColor;

  static Environment get environment => _environment;

  static void setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.DEVELOPMENT:
        {
          title = '${AppStrings.appName} - Dev';
          debugBanner = true;
          statusBarColor = AppColors.backgroundColor;
          statusBarIconColor = Brightness.dark;
          break;
        }
      case Environment.PRODUCTION: {
        title = AppStrings.appName;
        debugBanner = false;
        baseUrl = '${dotenv.env['BASE_URL']}';
        statusBarColor = AppColors.backgroundColor;
        statusBarIconColor = Brightness.dark;
        break;
      }
    }
  }
}
