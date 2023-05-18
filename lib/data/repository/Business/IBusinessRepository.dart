import '../../model/Business/business_model.dart';

abstract class IBusinessRepository {
  Future<void> saveBusiness(BusinessModel business);

  Future<String> uploadBusinessPhoto(
      String localPhotoUrl, String businessId, String folderPath);

  Future<BusinessModel?> getBusinessById(String businessId);

  String generateBusinessId();

  Future<List<String>> uploadMultiplePhotos(
      List<String> localPhotoUrl, String businessId, String folderPath);
}
