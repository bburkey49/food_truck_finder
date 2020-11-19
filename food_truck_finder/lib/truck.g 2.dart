// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Truck _$TruckFromJson(Map<String, dynamic> json) {
  return Truck(
    json['name'] as String,
    json['rating'] as int,
    json['pathToImage'] as String,
    json['foodType'] as String,
    json['price'] as int,
    json['menu'] as List,
  );
}

Map<String, dynamic> _$TruckToJson(Truck instance) => <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'pathToImage': instance.pathToImage,
      'foodType': instance.foodType,
      'price': instance.price,
      'menu': instance.menu,
    };
