import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/Product/product_model.dart';
import 'package:gomart/data/repository/Product/IProductRepository.dart';
import 'package:gomart/screens/Search/bloc/search_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SearchCubit extends Cubit<SearchState> {
  final IProductRepository _productRepo;

  SearchCubit(this._productRepo) : super(SearchState.initial());

  searchByQuery(String? query) async {
    emit(SearchState.initial());
    try{
      if (query != null && query.trim().isNotEmpty) {
        List<ProductModel> products =
        await _productRepo.getSearchResultsBySearchTerm(query);
        emit(SearchState.success(products));
      }else{
        emit(SearchState.success([]));
      }
    }catch(e){
      if (kDebugMode) {
        print('****** our error is $e');
      }
      emit(SearchState.failure());
    }

  }
}
