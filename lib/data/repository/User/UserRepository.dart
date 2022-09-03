import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gomart/data/model/FlagCountryCode/flag_country_code.dart';
import 'package:injectable/injectable.dart';

import 'IUserRepository.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  UserRepository(
      this._firebaseAuth, this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  @override
  bool isSignedIn(){
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> register(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required FlagCountryCodeModel country,
      required PhoneAuthCredential credential,
      DateTime? dateOfBirth,
      String? localPhotoUrl}) async {
    try {
      String? newPhotoUrl;
      await _firebaseAuth.signInWithCredential(credential);
      var user = _firebaseAuth.currentUser;
      //update user
      await _firebaseAuth.currentUser!
          .updateDisplayName('$firstName $lastName');
      await _firebaseAuth.currentUser!.updatePhoneNumber(credential);

      if (localPhotoUrl != null) {
        String uploadPhotoUrl =
            await _uploadProfilePhoto(localPhotoUrl, user?.uid as String);
        newPhotoUrl = uploadPhotoUrl;
        await _firebaseAuth.currentUser!.updatePhotoURL(uploadPhotoUrl);
      }

      //upload userdata to firestore USERS/UID
      await _updateUserDocument(
          uid: user?.uid as String,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: '${country.countryCode}$phoneNumber',
          dateOfBirth: dateOfBirth,
          country: country,
          photoUrl: newPhotoUrl);
      await _firebaseAuth.currentUser!.reload();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _updateUserDocument({
    required String uid,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required FlagCountryCodeModel country,
    DateTime? dateOfBirth,
    String? photoUrl,
  }) async {
    var data = {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'photoUrl': photoUrl,
      'country': _mapToCountry(country)
    };

    return await _firebaseFirestore.collection('USERS').doc(uid).set(data);
  }

  Future<String> _uploadProfilePhoto(
      String localPhotoUrl, String userId) async {
    File imgFile = File(localPhotoUrl);
    final Reference storageReference =
        _firebaseStorage.ref().child("USERS/ProfilePhoto/$userId");
    UploadTask uploadTask =
        storageReference.child("profilePhoto.jpg").putFile(imgFile);

    String url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }

  @override
  Future<void> signIn(
      {required String phoneNumber,
      required PhoneAuthCredential credential}) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
      var user = _firebaseAuth.currentUser;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<bool> checkIfUserExists() {
    // TODO: implement checkIfUserExists
    throw UnimplementedError();
  }
}

_mapToCountry(FlagCountryCodeModel country) {
  return {
    'countryCode': country.countryCode,
    'countryFlag': country.flag,
    'countryName': country.countryName,
    'countryId': country.id
  };
}
