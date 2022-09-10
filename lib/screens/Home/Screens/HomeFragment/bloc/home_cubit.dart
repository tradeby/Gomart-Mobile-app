import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
