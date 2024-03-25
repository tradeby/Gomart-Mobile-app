
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'business_model.freezed.dart';
part 'business_model.g.dart';


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
    //Timestamp? membersSince,
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
    //Timestamp? createdOn,
    //Timestamp? updatedOn,
  }) = _BusinessModel;

  factory BusinessModel .fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);

  static BusinessModel fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return BusinessModel.fromJson(data);
  }
}