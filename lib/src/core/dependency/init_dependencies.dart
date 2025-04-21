import 'package:ecommerce/src/app_config/imports/import.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerLazySingleton(() => InitializeApp());
  serviceLocator.registerSingleton<ApiResponseHandler>(ApiResponseHandler());
  serviceLocator.registerSingleton<ApiErrorHandler>(ApiErrorHandler());
  serviceLocator.registerFactory(() => RestApi(
    apiResponseHandler: serviceLocator(),
    apiErrorHandler: serviceLocator(),
  ));


}
