import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';

class ProductsInformation implements UseCase<List<Product>, NoParams>{
  ProductsInformation({
    required this.productsRepositories,
    required this.connectivityService
  });

  ProductsRepositories productsRepositories;
  final ConnectivityService connectivityService;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params)async{
    try {
      final isConnected = await connectivityService.isConnected();
      if (!isConnected) {
        final rawData = await HiveCache.getData<List>(
          boxName: 'productInformation',
          key: 'product_list',
        );
        final cachedData = rawData?.cast<ProductInformationModel>();
        if (cachedData != null) {
          final entities = cachedData.toEntityList();
          return(Right(entities));
        } else {
          return const Left(UnknownError('Failed to load data'));
        }
      }
      final response = await productsRepositories.productsInformation();
      if (response is Right) {
        final data = response.fold(
              (failure) => <ProductInformationModel>[],
              (success) => success,
        );
        await HiveCache.clearBox<List<ProductInformationModel>>(boxName: 'productInformation');
        await HiveCache.setData<List<ProductInformationModel>>(
          boxName: 'productInformation',
          key: 'product_list',
          value: data,
        );
        final entities = data.toEntityList();
        return Right(entities);
      } else {
        return const Left(UnknownError('Failed to fetch data'));
      }
    } catch (e) {
      return const Left(UnknownError("Failed to initialize app"));
    }
  }

}