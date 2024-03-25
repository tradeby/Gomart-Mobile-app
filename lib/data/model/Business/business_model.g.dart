// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessModel _$$_BusinessModelFromJson(Map<String, dynamic> json) =>
    _$_BusinessModel(
      id: json['id'] as String?,
      companyName: json['companyName'] as String?,
      businessCategory: json['businessCategory'] as String?,
      address: json['address'] as String?,
      closingTime: json['closingTime'] as String?,
      openingTime: json['openingTime'] as String?,
      daysOpen: json['daysOpen'] as String?,
      numberOfFollowers: json['numberOfFollowers'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      state: json['state'] as String?,
      area: json['area'] as String?,
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      analytics: json['analytics'] as Map<String, dynamic>?,
      chat: json['chat'] as Map<String, dynamic>?,
      logoUrl: json['logoUrl'] as String?,
      isDeactivated: json['isDeactivated'] as bool?,
      isPublished: json['isPublished'] as bool?,
      coverPhotoUrl: json['coverPhotoUrl'] as String?,
      galleryPhotos: (json['galleryPhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_BusinessModelToJson(_$_BusinessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'businessCategory': instance.businessCategory,
      'address': instance.address,
      'closingTime': instance.closingTime,
      'openingTime': instance.openingTime,
      'daysOpen': instance.daysOpen,
      'numberOfFollowers': instance.numberOfFollowers,
      'phoneNumber': instance.phoneNumber,
      'state': instance.state,
      'area': instance.area,
      'map': instance.map,
      'analytics': instance.analytics,
      'chat': instance.chat,
      'logoUrl': instance.logoUrl,
      'isDeactivated': instance.isDeactivated,
      'isPublished': instance.isPublished,
      'coverPhotoUrl': instance.coverPhotoUrl,
      'galleryPhotos': instance.galleryPhotos,
    };
