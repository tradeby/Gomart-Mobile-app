// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductEntity _$$_ProductEntityFromJson(Map<String, dynamic> json) =>
    _$_ProductEntity(
      id: json['id'] as String?,
      productName: json['productName'] as String?,
      price: json['price'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      productImageUrl: json['productImageUrl'] as String?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$$_ProductEntityToJson(_$_ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'price': instance.price,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'productImageUrl': instance.productImageUrl,
      'companyName': instance.companyName,
    };
