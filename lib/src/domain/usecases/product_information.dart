import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';


class ProductsInformation implements UseCase<Product, NoParams>{
  ProductsInformation({required this.productsRepositories});

  ProductsRepositories productsRepositories;

  @override
  Future<Either<Failure, Product>> call(NoParams params)async{
    try {
      final response = await productsRepositories.productsInformation();
      if (response is Right) {
        final data = response.fold(
              (failure) => <String, dynamic>{},
              (success) => success,
        );
        final productInformationModel = ProductInformationModel.fromJson(data);
        final entity = productInformationModel.toEntity();

        return Right(entity);
      } else {
        return const Left(UnknownError('Failed to fetch data'));
      }
    } catch (e) {
      return const Left(UnknownError("Failed to initialize app"));
    }
  }

}