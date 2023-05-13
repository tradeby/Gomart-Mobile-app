
import 'package:freezed_annotation/freezed_annotation.dart';

import 'business_entity.dart';

part 'business_model.freezed.dart';


@freezed
class BusinessModel with _$BusinessModel {
  const BusinessModel._();

  const factory BusinessModel({
    String? id,
    String? companyName,
    String? businessCategory,
    String? address,
    String? closingTime,
    String? openingTime,
    String? daysOpen,
    String? membersSince,
    int? numberOfFollowers,
    String? phoneNumber,
    String? state,
    String? area,
    Map<String, double>? map,
    Map<String, dynamic>? analytics,
    Map<String, dynamic>? chat,
    String? logoUrl,
    bool? isDeactivated,
    bool? isPublished,
    String? coverPhotoUrl,
    List<String>? galleryPhotos,
    //BusinessManagerModel? businessManager,
    String? createdOn,
    String? updatedOn,
  }) = _BusinessModel;

  BusinessEntity toEntity() {
    return BusinessEntity(
      id: id,
      companyName: companyName,
      businessCategory: businessCategory,
      address: address,
      closingTime: closingTime,
      openingTime: openingTime,
      daysOpen: daysOpen,
      membersSince: membersSince,
      numberOfFollowers: numberOfFollowers,
      phoneNumber: phoneNumber,
      state: state,
      area: area,
      map: map,
      analytics: analytics,
      chat: chat,
      logoUrl: logoUrl,
      isDeactivated: isDeactivated,
      isPublished: isPublished,
      coverPhotoUrl: coverPhotoUrl,
      galleryPhotos: galleryPhotos,
     // businessManager: businessManager?.toEntity(),
      createdOn: createdOn,
      updatedOn: updatedOn,
    );
  }

  static BusinessModel fromEntity(BusinessEntity entity) {
    return BusinessModel(
      id: entity.id,
      companyName: entity.companyName,
      businessCategory: entity.businessCategory,
      address: entity.address,
      closingTime: entity.closingTime,
      openingTime: entity.openingTime,
      daysOpen: entity.daysOpen,
      membersSince: entity.membersSince,
      numberOfFollowers: entity.numberOfFollowers,
      phoneNumber: entity.phoneNumber,
      state: entity.state,
      area: entity.area,
      map: entity.map,
      analytics: entity.analytics,
      chat: entity.chat,
      logoUrl: entity.logoUrl,
      isDeactivated: entity.isDeactivated,
      isPublished: entity.isPublished,
      coverPhotoUrl: entity.coverPhotoUrl,
      galleryPhotos: entity.galleryPhotos,
    /*  businessManager: entity.businessManager != null
          ? BusinessManagerModel.fromEntity(entity.businessManager!)
          : null,*/
      createdOn: entity.createdOn,
      updatedOn: entity.updatedOn,
    );
  }
}