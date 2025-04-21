import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';

class ProductsRepositoriesImpl implements ProductsRepositories{
  ProductsRepositoriesImpl({required this.productsApiService});

  final ProductsApiService productsApiService;


  @override
  Future<Either<Failure, Map<String, dynamic>>> productsInformation()async{
    try{
      Map<String, dynamic> response = await productsApiService.getProductInformation();
      return right(response);
    }catch(e){
      return left(UnknownError(e));
    }
  }

}