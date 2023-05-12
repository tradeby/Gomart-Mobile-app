import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'business_cubit.freezed.dart';

@freezed
abstract class BusinessState with _$BusinessState {
  const factory BusinessState({
    String? bannerUrl,
    String? logoUrl,
    String? businessName,
    String? phoneNumber,
    String? emailAddress,
    String? address,
    int? gallaryIndex,
    required List<String> gallaryPhotos,
  }) = _BusinessState;

  factory BusinessState.initial() => const BusinessState(
        gallaryPhotos: [],
      );
}

@Injectable()
class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit() : super(BusinessState.initial());

  void setBannerImage(croppedImagePath) => emit(state.copyWith(
      bannerUrl: croppedImagePath, gallaryPhotos: state.gallaryPhotos));

  void setLogoImage(croppedImagePath) => emit(state.copyWith(
      logoUrl: croppedImagePath, gallaryPhotos: state.gallaryPhotos));

  void setGalleryImage(String image) {
    emit(state.copyWith(gallaryPhotos: state.gallaryPhotos + [image]));
    emit(state.copyWith(gallaryIndex: state.gallaryPhotos.length - 1));
  }

  void setGallaryIndex(int index) => emit(state.copyWith(gallaryIndex: index));

  void setPhoneNumber(_) => emit(state.copyWith(phoneNumber: _));

  void setBusinessName(_) => emit(state.copyWith(businessName: _));

  void setEmailAddress(_) => emit(state.copyWith(emailAddress: _));
}
