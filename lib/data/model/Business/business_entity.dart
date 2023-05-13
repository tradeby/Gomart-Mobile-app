import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_entity.freezed.dart';
part 'business_entity.g.dart';


@freezed
class BusinessEntity with _$BusinessEntity {
  const factory BusinessEntity({
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
    //BusinessManagerEntity? businessManager,
    String? createdOn,
    String? updatedOn,
  }) = _BusinessEntity;

  factory BusinessEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessEntityFromJson(json);

  static BusinessEntity fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return BusinessEntity.fromJson(data);
  }
}

