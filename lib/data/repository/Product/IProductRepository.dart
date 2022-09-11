import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gomart/data/model/Product/product_model.dart';
import 'package:gomart/data/model/Product/product_repository_output.dart';

abstract class IProductRepository {
  Future<ProductRepositoryOutput> getProductsList();

  Future<ProductRepositoryOutput> getHomeProducts();

  Future<ProductRepositoryOutput> getProductsBySearchTerm(
      List<String> searchTerms);

  Future<ProductRepositoryOutput> getProductsLoadMore(
      Query lastQuery, DocumentSnapshot passedLastDocument);

  Future<ProductModel?> getProductUrlId(String productId);

  Future<ProductModel> getProductById(String productId);

  Future<List<ProductModel>>  getSearchResultsBySearchTerm(String? searchTerm);
  Future<void> seedSampleData(List<ProductModel> data);
}
