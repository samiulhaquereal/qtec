import 'package:ecommerce/src/app_config/imports/import.dart';


abstract interface class ProductsApiService{
  Future<Map<String, dynamic>> getProductInformation();
}

class ProductsApiServiceImpl extends ProductsApiService{
  ProductsApiServiceImpl({required this.restApi});

  final RestApi restApi;

  @override
  Future<Map<String, dynamic>> getProductInformation()async{
    try{
      final response = await restApi.get(
          baseURL: ApiConstants.baseUrl,
          endpoint: ApiConstants.products,
      );
      return response;
    }catch(e){
      throw UnknownError(e.toString());
    }
  }


}