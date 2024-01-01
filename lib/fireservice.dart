import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FireAuth fireAuth = FireAuth();
User? currentUser = FirebaseAuth.instance.currentUser;

class FireAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpUser(
    String email,
    String password,
    String Password,
  ) async {
    try {
      final data = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = data.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

Fireauth fireauth = Fireauth();

class Fireauth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInUser(String email, String password) async {
    try {
      final data = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = data.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

FirebaseService firebaseService = FirebaseService();

class FirebaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void setData(String email, String password, String username, String Phone) {
    firebaseFirestore.collection('user').doc(currentUser!.uid).set({
      'email': email,
      'password': password,
      'username': username,
      'Phone': Phone,
      'userid': currentUser!.uid,
      'createdAt': DateTime.now(),
    });
  }
}

FireAuthforgot fireAuthforgot = FireAuthforgot();

class FireAuthforgot {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void forgotemail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

// FireAuthpassword fireAuthpassword = FireAuthpassword();
//
// class FireAuthpassword {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   void forgotpasword(var phoneNumber) async {
//     try {
//       await firebaseAuth.signInWithPhoneNumber(phoneNumber);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
