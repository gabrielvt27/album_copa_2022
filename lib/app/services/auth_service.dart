import 'package:album2022/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  UserModel? userModel;

  AuthService() {
    _handleAuthState();
  }

  _handleAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((snapshot) {
      if (snapshot != null) {
        _setUser(snapshot);
        Modular.to.navigate('/album');
      } else {
        Modular.to.navigate('/login');
      }
    });
  }

  _setUser(User user) {
    userModel = UserModel(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
      photo: user.photoURL,
    );
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    _setUser(userCredential.user!);

    FirebaseFirestore.instance
        .collection('completedStickersUser')
        .doc(userCredential.user!.uid)
        .set({
      "email": userCredential.user!.email,
      "name": userCredential.user!.displayName,
    });
  }

  signOut() {
    userModel = null;
    FirebaseAuth.instance.signOut();
  }
}
