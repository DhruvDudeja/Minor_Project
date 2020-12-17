import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthHelper {
  static signInWithEmail({String email, String password}) async {
    final res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;
  }

  static signUpWithEmail({String email, String password}) async {
    final res = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = res.user;
    return user;
  }

  static signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final acc = await googleSignIn.signIn();
    final auth = await acc.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken, idToken: auth.idToken);
    final res = await _auth.signInWithCredential(credential);
    return res.user;
  }

  static logOut() {
    GoogleSignIn().signOut();
    return _auth.signOut();
  }

  static getUserDetails() {
    // final name = _auth.currentUser.displayName;
    // final email = _auth.currentUser.email;
    // final photo = _auth.currentUser.photoURL;
    var userData = {
      'name': _auth.currentUser.displayName,
      'email': _auth.currentUser.email,
      'photo': _auth.currentUser.photoURL
    };
    print(userData);
    return userData;
  }
}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(String name, String phone, String email) async {
    User user = _auth.currentUser;
    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "phone": phone,
    };

    final userRef = _db.collection("users").doc(user.uid);
    await userRef.set(userData);
  }

  static saveContact(String name, String phone, String email) async {
    User user = _auth.currentUser;
    Map<String, dynamic> contactData = {
      "name": name,
      "email": email,
      "phone": phone,
    };
    final contactRef =
        _db.collection("users").doc(user.uid).collection("contacts");
    await contactRef.add(contactData);
  }
}
