import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Product/product_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required bool searchInProgress,
      required bool searchFailure,
      required bool searchSuccess,
      String? searchTerm,
      required List<ProductModel> searchResults
      }) = _SearchState;

  factory SearchState.initial() {
    return const SearchState(
      searchFailure: false,
      searchInProgress: true,
      searchSuccess: false,
      searchResults: []
    );
  }

  factory SearchState.success(List<ProductModel> products) {
    return SearchState(
      searchResults: products,
      searchFailure: false,
      searchInProgress: false,
      searchSuccess: true,

    );
  }

  factory SearchState.failure() {
    return const SearchState(
      searchFailure: true,
      searchInProgress: false,
      searchSuccess: false,
        searchResults: []
    );
  }
}
