import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServis {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    return await signOut();
  }

  forgetPass(String email) async {
    var pass = await _auth.sendPasswordResetEmail(email: email);
  }

  Future<User?> createUser(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection('users')
        .doc(user.user?.uid)
        .set({'mail': email, 'pass': password});

    return user.user;
  }
}
