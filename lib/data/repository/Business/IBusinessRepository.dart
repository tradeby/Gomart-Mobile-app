import '../../../shared_components/imageAddPreview/image_type_model.dart';
import '../../model/Business/business_model.dart';

abstract class IBusinessRepository {
  Future<void> saveBusiness(BusinessModel business);

  Future<String> uploadBusinessPhoto(
      ImageTypeModel localPhotoUrl, String businessId, String folderPath);

  Future<BusinessModel?> getBusinessById(String businessId);

  String generateBusinessId();

  Future<List<String>> uploadMultiplePhotos(
      List<ImageTypeModel> localPhotoUrl, String businessId, String folderPath);
}
