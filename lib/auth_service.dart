//REQUIRED

//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:gighub/services/global_variables.dart';
import 'package:gighub/uploaded_by.dart';
import 'package:gighub/user.dart';
import 'package:provider/provider.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<String> createUserWithEmailAndPassword(String email, String password,
      String firstname, String lastname, String phone, String location) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty ||
          phone.isNotEmpty ||
          location.isNotEmpty) {
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(credential.user!.uid);
        //add user
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'firstname': firstname.toUpperCase(),
          'lastname': lastname.toUpperCase(),
          'uid': credential.user!.uid,
          'email': email,
          'phone': phone,
          'location': location
        });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    await UploadedBy(uid: getCurrentUID()).user_phone(phone);

    return res;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser)!.uid;
  }
}
