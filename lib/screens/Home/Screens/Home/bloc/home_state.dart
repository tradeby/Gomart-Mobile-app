import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Product/product_model.dart';
import 'package:gomart/data/model/Product/product_repository_output.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required bool loadInProgress,
      required bool loadFailure,
      required bool loadSuccess,
      required double longitude,
      required double latitude,
        String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      loadInProgress: false,
      loadFailure: false,
      loadSuccess: false,
      longitude: 0.0,
      latitude: 0.0,
    );
  }

  factory HomeState.productsLoadFailure(String error) {
    return  HomeState(
        loadFailure: true, loadInProgress: false, loadSuccess: false, longitude: 0.0, latitude: 0.0,
        error: error,);
  }

  factory HomeState.productLoadSuccess(ProductRepositoryOutput productOutput) {
    return HomeState(
        loadFailure: false,
        loadInProgress: false,
        loadSuccess: true,
        longitude: 0.0,
        latitude: 0.0,
        homeProducts: productOutput.productsList,
        productsOutput: productOutput);
  }
}
