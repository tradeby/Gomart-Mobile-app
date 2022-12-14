import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/Product/product_repository_output.dart';
import 'package:gomart/data/repository/Product/IProductRepository.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final IProductRepository _productRepo;

  HomeCubit(this._productRepo) : super(HomeState.initial());

  loadHomeProducts() {
    HomeState.initial();
   _productRepo
        .getHomeProducts()
        .then((productOut) => homeProductsUpdated(productOut))
        .catchError((onError) => errorEncountered(onError));
  }

  homeProductsUpdated(ProductRepositoryOutput productOutput) =>
      emit(HomeState.productLoadSuccess(productOutput));

  errorEncountered(error) {
      if (kDebugMode) {
        print('******* our error is $error');
      }

    emit(HomeState.productsLoadFailure(error));
  }
}
