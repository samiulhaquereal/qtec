import 'package:ecommerce/src/app_config/imports/import.dart';
import 'package:fpdart/fpdart.dart';

class ProductsRepositoriesImpl implements ProductsRepositories{
  ProductsRepositoriesImpl({required this.productsApiService});

  final ProductsApiService productsApiService;


  @override
  Future<Either<Failure, List<ProductInformationModel>>> productsInformation()async{
    try{
      List<dynamic> response = await productsApiService.getProductInformation();
      List<ProductInformationModel> productInformationModels = response.map((json) => ProductInformationModel.fromJson(json)).toList();
      return right(productInformationModels);
    }catch(e){
      return left(UnknownError(e));
    }
  }

}