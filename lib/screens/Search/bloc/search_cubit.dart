import 'package:bloc/bloc.dart';
import 'package:gomart/screens/Search/bloc/search_state.dart';




class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());
}
