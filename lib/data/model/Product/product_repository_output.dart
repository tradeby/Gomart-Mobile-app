import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomart/data/model/Product/product_model.dart';

@immutable
class ProductRepositoryOutput {
  final List<ProductModel> productsList;
  final Query lastQuery;
  final DocumentSnapshot? lastDocument;
  final bool hasReachedMax;
  final String? status;

  const ProductRepositoryOutput(
      {this.status,required this.productsList,
      required this.lastQuery,
      required this.lastDocument,
      required this.hasReachedMax});

  @override
  toString() =>
      '$productsList lastQuery:$lastQuery, lastDocument:$lastDocument, hasReachedMax: $hasReachedMax';
}
