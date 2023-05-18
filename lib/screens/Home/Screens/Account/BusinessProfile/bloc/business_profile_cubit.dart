
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Business/business_model.dart';
import 'package:gomart/data/repository/Business/IBusinessRepository.dart';
import 'package:injectable/injectable.dart';

part 'business_profile_cubit.freezed.dart';
@freezed
abstract class BusinessProfileState with _$BusinessProfileState {
  const factory BusinessProfileState({
    required bool loading,
    String? error,
    BusinessModel? business,

  }) = _BusinessProfileState;

  factory BusinessProfileState.initial() => const BusinessProfileState(
      loading: true
  );
}

@Injectable()
class BusinessProfileCubit extends Cubit<BusinessProfileState> {
  final IBusinessRepository _businessRepo;

  BusinessProfileCubit(this._businessRepo) : super(BusinessProfileState.initial());

  Future<void> loadBusiness(String businessId) async {

    emit(BusinessProfileState.initial());
    try { //get business by id from the businessBloc
      BusinessModel? foundBus = await _businessRepo.getBusinessById(businessId);
      emit(state.copyWith(loading: false, business: foundBus));
    }catch(e){
      if (kDebugMode) {
        print('#######@@@@@@$e');
      }
      emit(state.copyWith(loading: false, business: null, error:'$e'));
    }
  }


}
