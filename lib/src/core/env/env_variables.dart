import 'package:ecommerce/src/app_config/imports/import.dart';

class EnvVariables {
  EnvVariables._();

  static String get apiVersion => dotenv.env['API_VERSION'] ?? '';
  static String get products => dotenv.env['ENDPOINT_PRODUCTS'] ?? '';
}

