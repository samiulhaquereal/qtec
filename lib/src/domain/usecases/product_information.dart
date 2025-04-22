import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';


class ProductsInformation implements UseCase<List<Product>, NoParams>{
  ProductsInformation({required this.productsRepositories});

  ProductsRepositories productsRepositories;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params)async{
    try {
      final response = await productsRepositories.productsInformation();
      if (response is Right) {
        final data = response.fold(
              (failure) => <ProductInformationModel>[],
              (success) => success,
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