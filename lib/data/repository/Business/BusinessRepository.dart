import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _firebaseAuth;

  FirebaseBusinessRepository(
      this._firestore, this._firebaseStorage, this._firebaseAuth);

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

    //getCurrentUser
    final currentUser = _firebaseAuth.currentUser;
    //setbusinessId

    final userRef = _firestore.collection('USERS').doc(currentUser?.uid);
    final userDoc = await userRef.get();

    if (userDoc.exists) {
      final userData = userDoc.data();
      data['businessManager'] = userData;

      WriteBatch batch = _firestore.batch();
      batch.set(_firestore.collection('BUSINESSES').doc(business.id), data);
      //add business.id to User
      batch.set(_firestore.collection('USERS').doc(currentUser?.uid),
          {'businessId': business.id}, SetOptions(merge: true));
      await batch.commit();
    } else {
      throw Exception('User not found, user not logged in');
    }
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
