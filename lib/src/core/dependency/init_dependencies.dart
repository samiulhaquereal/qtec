import 'package:ecommerce/src/app_config/imports/import.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerLazySingleton(() => InitializeApp());
  serviceLocator.registerLazySingleton(() => Connectivity());
  serviceLocator.registerLazySingleton(() => ConnectivityService(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SnackBarWidget());
  serviceLocator.registerSingleton<ApiResponseHandler>(ApiResponseHandler());
  serviceLocator.registerSingleton<ApiErrorHandler>(ApiErrorHandler());
  serviceLocator.registerFactory(() => RestApi(
    apiResponseHandler: serviceLocator(),
    apiErrorHandler: serviceLocator(),
  ));
  serviceLocator.registerLazySingleton<ProductsApiService>(
        () => ProductsApiServiceImpl(restApi: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ProductsRepositories>(
        () => ProductsRepositoriesImpl(productsApiService: serviceLocator()));

  serviceLocator.registerLazySingleton(() => ProductsInformation(
      productsRepositories: serviceLocator(),
      connectivityService: serviceLocator()
  ));


}
