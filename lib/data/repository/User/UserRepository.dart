import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'IUserRepository.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  UserRepository(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> register(
      {required String username,
      required String email,
      required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return false;
  }
}
