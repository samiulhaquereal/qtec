import 'package:hive/hive.dart';
import 'dart:convert';
part 'productInformationModel.g.dart';

List<ProductInformationModel> productInformationModelFromJson(String str) => List<ProductInformationModel>.from(json.decode(str).map((x) => ProductInformationModel.fromJson(x)));

String productInformationModelToJson(List<ProductInformationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class ProductInformationModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  double? price;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? category;
  @HiveField(6)
  String? image;
  @HiveField(7)
  Rating? rating;

  ProductInformationModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductInformationModel.fromJson(Map<String, dynamic> json) => ProductInformationModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };
}

@HiveType(typeId: 2)
class Rating {
  @HiveField(1)
  double? rate;
  @HiveField(2)
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
