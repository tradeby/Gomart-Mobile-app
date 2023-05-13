import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:gomart/data/model/Business/business_entity.dart';
import 'package:gomart/data/model/Business/business_model.dart';
import 'package:injectable/injectable.dart';

import 'IBusinessRepository.dart';

@Injectable(as: IBusinessRepository)
class FirebaseBusinessRepository implements IBusinessRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  FirebaseBusinessRepository(this._firestore, this._firebaseStorage);

  Future<String> _uploadBusinessPhotos(
      String localPhotoUrl, String businessId, String folderPath) async {
    File imgFile = File(localPhotoUrl);
    String uploadFolderPath = "BUSINESS/$businessId/$folderPath/";
    final Reference storageReference =
        _firebaseStorage.ref().child(uploadFolderPath);

    // Generate Firestore document ID
    String generatedId = _firestore.collection('UPLOADED_PHOTOS').doc().id;
    String extension = imgFile.path.split('.').last;
    String newFileName = "$generatedId.$extension";

    UploadTask uploadTask =
        storageReference.child(newFileName).putFile(imgFile);

    String url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }

  @override
  Future<void> saveBusiness(BusinessModel business) async {
    final data = business.toEntity().toJson();
    data['updatedOn'] = Timestamp.now();
    data['createdOn'] = Timestamp.now();
    data['membersSince'] = Timestamp.now();
    await _firestore.collection('BUSINESSES').doc(business.id).set(data);
    //add business.id to User
  }

  @override
  Future<String> uploadBusinessPhoto(
      String localPhotoUrl, String businessId, String folderPath) async {
    String imageUrl =
        await _uploadBusinessPhotos(localPhotoUrl, businessId, folderPath);
    return imageUrl;
  }

  @override
  Future<List<String>> uploadMultiplePhotos(
      List<String> localPhotoUrls, String businessId, String folderPath) async {
    List<String> imageUrls = [];
    for (int i = 0; i < localPhotoUrls.length; i++) {
      String imageUrl = await _uploadBusinessPhotos(
          localPhotoUrls[i], businessId, folderPath);
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }

  @override
  String generateBusinessId() {
    String generatedId = _firestore.collection('UPLOADED_PHOTOS').doc().id;
    return generatedId;
  }
}
