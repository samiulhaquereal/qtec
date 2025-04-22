// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productInformationModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductInformationModelAdapter extends TypeAdapter<ProductInformationModel> {
  @override
  final int typeId = 1;

  @override
  ProductInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductInformationModel(
      id: fields[1] as int?,
      title: fields[2] as String?,
      price: fields[3] as double?,
      description: fields[4] as String?,
      category: fields[5] as String?,
      image: fields[6] as String?,
      rating: fields[7] as Rating?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductInformationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatingAdapter extends TypeAdapter<Rating> {
  @override
  final int typeId = 2;

  @override
  Rating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rating(
      rate: fields[1] as double?,
      count: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Rating obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.rate)
      ..writeByte(2)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
