import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/Product/product_entity.dart';
import 'package:gomart/data/model/Product/product_model.dart';

import 'package:gomart/data/model/Product/product_repository_output.dart';
import 'package:injectable/injectable.dart';

import 'IProductRepository.dart';

@Injectable(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  final Algolia _algoliaClient;

  ProductRepository(this._firebaseFirestore, this._algoliaClient);

  @override
  Future<ProductRepositoryOutput> getHomeProducts() async {
    final collection = await getCollection();
    const int pageSize = 30;
    final query = collection.limit(pageSize);
    final querySnapshot = await query.get();
    final documents = querySnapshot.docs;
    final lastDocument = null;

    return ProductRepositoryOutput(
        status:
            'I came here without issueand found ${querySnapshot.docs.length}',
        productsList: documents
            .map((doc) =>
                ProductModel.fromEntity(ProductEntity.fromSnapshot(doc)))
            .toList(),
        lastDocument: lastDocument,
        lastQuery: query,
        hasReachedMax: documents.length < pageSize);
  }

  @override
  Future<ProductModel> getProductById(String productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<ProductRepositoryOutput> getProductsLoadMore(
      Query lastQuery, DocumentSnapshot passedLastDocument) async {
    const int pageSize = 30;
    Query query = lastQuery.startAfterDocument(passedLastDocument);

    final querySnapshot = await query.get();
    final documents = querySnapshot.docs;
    final DocumentSnapshot? lastDocument =
        documents.isNotEmpty ? documents[documents.length - 1] : null;

    return ProductRepositoryOutput(
        productsList: documents
            .map((doc) =>
                ProductModel.fromEntity(ProductEntity.fromSnapshot(doc)))
            .toList(),
        lastDocument: lastDocument,
        lastQuery: query,
        hasReachedMax: documents.length < pageSize);
  }

  @override
  Future<ProductModel?> getProductUrlId(String productUrlId) async {
    final collection = await getCollection();
    if (kDebugMode) {
      print('********* our getProductById productUrlId $productUrlId');
    }
    //productUrl

    final productDocs = await collection
        .where('productUrl', isEqualTo: productUrlId)
        .limit(1)
        .get();

    if (productDocs.docs.isNotEmpty) {
      return ProductModel.fromEntity(
          ProductEntity.fromSnapshot(productDocs.docs[0]));
    } else {
      return null;
    }
  }

  @override
  Future<ProductRepositoryOutput> getProductsBySearchTerm(
      List<String> searchTerms) {
    // TODO: implement getProductsBySearchTerm
    throw UnimplementedError();
  }

  @override
  Future<ProductRepositoryOutput> getProductsList() async {
    final collection = await getCollection();
    const int pageSize = 30;
    final query = collection.limit(pageSize);
    final querySnapshot = await query.get();
    final documents = querySnapshot.docs;
    print('************* I am here $documents');
    final lastDocument =
        documents.isNotEmpty ? documents[documents.length - 1] : null;

    return ProductRepositoryOutput(
        productsList: documents
            .map((doc) =>
                ProductModel.fromEntity(ProductEntity.fromSnapshot(doc)))
            .toList(),
        lastDocument: lastDocument,
        lastQuery: query,
        hasReachedMax: documents.length < pageSize);
  }

  Future<CollectionReference> getCollection() async {
    return _firebaseFirestore.collection('PRODUCTS');
  }

  @override
  Future<void> seedSampleData(List<ProductModel> data) async {
    final collection = await getCollection();

    for (var i = 0; i < data.length; i++) {
      DocumentReference docRef =
          await collection.add(data[i].productEntity().toJson());
    }
  }

  @override
  Future<List<ProductModel>> getSearchResultsBySearchTerm(String? query) async {
    if (query != null) {
      AlgoliaQuery algoliaQuery = _algoliaClient.instance
          .index("sample_products")
          .query(query);
      AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
      final rawHits = snapshot.toMap()['hits'] as List;
      final hits = List<ProductModel>.from(rawHits
          .map((hit) => ProductModel.fromEntity(ProductEntity.fromJson(hit))));
    return hits;
    } else {
      return <ProductModel>[];
    }
  }
}
