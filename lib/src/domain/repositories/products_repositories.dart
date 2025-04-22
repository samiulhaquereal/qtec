import 'package:fpdart/fpdart.dart';
import 'package:ecommerce/src/app_config/imports/import.dart';

abstract interface class ProductsRepositories{
  Future<Either<Failure, List<ProductInformationModel>>> productsInformation();
}