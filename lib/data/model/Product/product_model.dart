import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Product/product_entity.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    String? id,
    String? productName,
    String? price,
    String? phoneNumber,
    String? address,
    String? openingTime,
    String? closingTime,
    String? productImageUrl,
    String? companyName,
  }) = _ProductModel;

ProductEntity productEntity() {
    return ProductEntity(
      id:id,
      productName:productName,
      price:price,
      phoneNumber:phoneNumber,
      address:address,
      openingTime:openingTime,
      closingTime:closingTime,
      productImageUrl:productImageUrl,
      companyName:companyName,
    );
  }
  static ProductModel fromEntity(ProductEntity entity){
    return ProductModel(
      id:entity.id,
      productName:entity.productName,
      price:entity.price,
      phoneNumber:entity.phoneNumber,
      address:entity.address,
      openingTime:entity.openingTime,
      closingTime:entity.closingTime,
      productImageUrl:entity.productImageUrl,
      companyName:entity.companyName,
    );
  }
}
