import 'package:ecommerce/src/app_config/imports/import.dart';

extension ProductModelMapper on ProductInformationModel {
  Product toEntity() {
    return Product(
      id: id ?? 0,
      title: title ?? '',
      price: price ?? 0.0,
      description: description ?? '',
      category: category ?? '',
      image: image ?? '',
      rating: rating?.toEntity() ?? ProductRating(rate: 0.0, count: 0),
    );
  }
}

extension RatingModelMapper on Rating {
  ProductRating toEntity() {
    return ProductRating(
      rate: rate ?? 0.0,
      count: count ?? 0,
    );
  }
}

extension ProductInformationModelListMapper on List<ProductInformationModel> {
  List<Product> toEntityList() {
    return map((productInformationModel) => productInformationModel.toEntity())
        .toList();
  }
}