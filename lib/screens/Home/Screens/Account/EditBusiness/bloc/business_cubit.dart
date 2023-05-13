import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Business/business_model.dart';
import 'package:gomart/data/repository/Business/IBusinessRepository.dart';
import 'package:injectable/injectable.dart';

part 'business_cubit.freezed.dart';

class LocationMap {
  final double latitude;
  final double longitude;
  final String address;

  const LocationMap(
      {required this.longitude, required this.latitude, required this.address});
}

@freezed
abstract class BusinessState with _$BusinessState {
  const factory BusinessState({
    bool? saving,
    String? bannerUrl,
    String? logoUrl,
    String? businessName,
    String? phoneNumber,
    String? emailAddress,
    String? openingTime,
    String? closingTime,
    String? daysOpen,
    String? address,
    int? gallaryIndex,
    LocationMap? locationMap,
    required List<String> gallaryPhotos,
  }) = _BusinessState;

  factory BusinessState.initial() => const BusinessState(
        gallaryPhotos: [],
      );
}

@Injectable()
class BusinessCubit extends Cubit<BusinessState> {
  final IBusinessRepository _businessRepo;

  BusinessCubit(this._businessRepo) : super(BusinessState.initial());

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

  void setOpeningTime(_) => emit(state.copyWith(openingTime: _));

  void setClosingTime(_) => emit(state.copyWith(closingTime: _));

  void setDaysOpen(_) => emit(state.copyWith(daysOpen: _));

  void setMapLocation(LocationMap _) => emit(state.copyWith(locationMap: _));

  void saveBusiness() async {
    //validate state
    emit(state.copyWith(saving: true));
    try {
      //upload pictures
      String? logoImageUrl;
      String? bannerImageUrl;
      List<String> gallaryImagesUrls = [];
     String businessId = 'RhX5gDFTBJZIleUmZoyz';
     // String businessId = _businessRepo.generateBusinessId();
      if (kDebugMode) {
        print('****** business id is $businessId');
      }
      if (state.logoUrl != null) {
        logoImageUrl = await _businessRepo.uploadBusinessPhoto(
            state.logoUrl as String, businessId, 'LOGO');
      }

      if (state.bannerUrl != null) {
        bannerImageUrl = await _businessRepo.uploadBusinessPhoto(
            state.bannerUrl as String, businessId, 'BANNER');
      }

      if (state.gallaryPhotos.isNotEmpty) {
        gallaryImagesUrls = await _businessRepo.uploadMultiplePhotos(
            state.gallaryPhotos, businessId, 'GALLERY_PHOTOS');
      }

      //create structure of business
      BusinessModel business = BusinessModel(
        id: businessId,
        companyName: state.businessName,
        address: state.locationMap?.address,
        closingTime: state.closingTime,
        openingTime: state.openingTime,
        daysOpen: state.daysOpen,
        phoneNumber: state.phoneNumber,
        businessCategory: 'entity.businessCategory',
        numberOfFollowers: 0,
        //state: entity.state,
        //area: entity.area,
        map: {
          'latitude': state.locationMap?.latitude ?? 0,
          'longitude': state.locationMap?.longitude ?? 0,
        },
        analytics: {
          'visitors': 0,
        },
        //chat: entity.chat,
        isDeactivated: false,
        isPublished: true,
        logoUrl: logoImageUrl,
        coverPhotoUrl: bannerImageUrl,
        galleryPhotos: gallaryImagesUrls,
        //membersSince: 'entity.membersSince',
        //createdOn: entity.createdOn,
        //updatedOn: entity.updatedOn,
      );

      //add businesss to businesses collection
      await _businessRepo.saveBusiness(business);
    } catch (e) {
      if (kDebugMode) {
        print('*********** error encountered $e');
      }
    }
    emit(state.copyWith(saving: false));
  } //set businessId to editing User
}
