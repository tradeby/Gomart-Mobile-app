import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/home.dart';

class FavoritesCubit extends Cubit<List<SampleProducts>> {
  FavoritesCubit() : super([]);

  void  toggleFavorite(SampleProducts product) {
    final currentFavorites = List<SampleProducts>.from(state);

    if (currentFavorites.contains(product)) {
      currentFavorites.remove(product);
    } else {
      currentFavorites.add(product);
    }

    emit(currentFavorites);
  }

  
}
