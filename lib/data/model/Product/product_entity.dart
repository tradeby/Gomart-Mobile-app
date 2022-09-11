import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    String? id,
    String? productName,
    String? price,
    String? phoneNumber,
    String? address,
    String? openingTime,
    String? closingTime,
    String? productImageUrl,
    String? companyName,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  static ProductEntity fromSnapshot(DocumentSnapshot snap) {
   // print('****** error is from here $snap');
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    //print('****** error is from here $data');
    return ProductEntity.fromJson(data);
  }
}
