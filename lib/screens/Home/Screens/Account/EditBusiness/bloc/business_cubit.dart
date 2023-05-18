import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomart/data/model/Business/business_model.dart';
import 'package:gomart/data/repository/Business/IBusinessRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../shared_components/imageAddPreview/image_type_model.dart';
import '../../../../../../shared_components/supportedOpeningClosingTimes/_convert_time.dart';

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
    String? businessId,
    ImageTypeModel? bannerUrl,
    ImageTypeModel? logoUrl,
    String? businessName,
    String? phoneNumber,
    String? emailAddress,
    String? openingTime,
    String? closingTime,
    String? daysOpen,
    String? address,
    int? gallaryIndex,
    LocationMap? locationMap,
    required List<ImageTypeModel> gallaryPhotos,
  }) = _BusinessState;

  factory BusinessState.initial() => const BusinessState(
        gallaryPhotos: [],
      );
}

@Injectable()
class BusinessCubit extends Cubit<BusinessState> {
  final IBusinessRepository _businessRepo;

  BusinessCubit(this._businessRepo) : super(BusinessState.initial());

  void initiateState(BusinessModel bus) {
    BusinessState newState = BusinessState(
      saving: false,
        businessId: bus.id,
      bannerUrl: bus.coverPhotoUrl!=null? ImageTypeModel(isFile: false , url:  bus.coverPhotoUrl!):null,
      logoUrl: bus.logoUrl!=null? ImageTypeModel(isFile: false , url:  bus.logoUrl!):null,
      businessName: bus.companyName,
      phoneNumber: bus.phoneNumber,
      emailAddress: 'bus.emailAddress',
      openingTime: bus.openingTime!=null? convertTime(bus.openingTime!):null,
      closingTime: bus.closingTime!=null? convertTime(bus.closingTime!):null,
      daysOpen: null,//bus.daysOpen,
      address: bus.address,
      gallaryIndex: null,
      locationMap: LocationMap(
          longitude: bus.map!['longitude'] ?? 0,
          latitude: bus.map!['latitude'] ?? 0,
          address: bus.address ?? ''),
      gallaryPhotos: bus.galleryPhotos?.map((e) => ImageTypeModel(isFile: false , url: e))
          .toList() ?? [],
    );
    emit(newState);
  }

  void setBannerImage(ImageTypeModel croppedImagePath) => emit(state.copyWith(
      bannerUrl: croppedImagePath, gallaryPhotos: state.gallaryPhotos));

  void setLogoImage(ImageTypeModel croppedImagePath) => emit(state.copyWith(
      logoUrl: croppedImagePath, gallaryPhotos: state.gallaryPhotos));

  void setGalleryImage(ImageTypeModel image) {
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
      String businessId =state.businessId==null? _businessRepo.generateBusinessId():state.businessId!;
      if (kDebugMode) {
        print('****** business id is $businessId');
      }
      if (state.logoUrl != null) {
        logoImageUrl = await _businessRepo.uploadBusinessPhoto(
            state.logoUrl!, businessId, 'LOGO');
      }

      if (state.bannerUrl != null) {
        bannerImageUrl = await _businessRepo.uploadBusinessPhoto(
            state.bannerUrl!, businessId, 'BANNER');
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
