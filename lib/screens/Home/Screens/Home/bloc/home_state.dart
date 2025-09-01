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
        String? error,
      List<ProductModel>? homeProducts,
      ProductRepositoryOutput? productsOutput }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      loadInProgress: false,
      loadFailure: false,
      loadSuccess: false,
    );
  }

  factory HomeState.productsLoadFailure(String error) {
    return  HomeState(
        loadFailure: true, loadInProgress: false, loadSuccess: false,
        error: error,);
  }

  factory HomeState.productLoadSuccess(ProductRepositoryOutput productOutput) {
    return HomeState(
        loadFailure: false,
        loadInProgress: false,
        loadSuccess: true,
        homeProducts: productOutput.productsList,
        productsOutput: productOutput);
  }
}
