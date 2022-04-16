import 'package:email_password_firebase_authentication/views/home.dart';
import 'package:email_password_firebase_authentication/views/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  GetStorage box = GetStorage();

  Future sighUp(email, password, context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var authCredential = credential.user;
      print(authCredential);
      if (authCredential!.uid.isNotEmpty) {
        box.write('id', authCredential.uid);
        box.write('email', authCredential.email);

        MotionToast.success(
          title: Text("Successful"),
          description: Text("userEmail has successfully registered."),
          width: 300,
          onClose: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => SignIn())),
          toastDuration: const Duration(seconds: 2),
          animationDuration: const Duration(seconds: 2),
        ).show(context);
      } else {
        print('failed signing up.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future sighIn(email, password, context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var authCredential = credential.user;
      print(authCredential);
      if (authCredential!.uid.isNotEmpty) {
        MotionToast.success(
          title: Text("Successful"),
          description: Text("userEmail has successfully signed in"),
          width: 300,
          onClose: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => Home())),
          toastDuration: const Duration(seconds: 2),
          animationDuration: const Duration(seconds: 2),
        ).show(context);
      } else {
        print('failed signing up.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = _userCredential.user;

    if (_user!.uid.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
    } else {
      MotionToast.error(
        title: Text("Sorry"),
        description: Text("Authentication failed"),
        width: 300,
        toastDuration: const Duration(seconds: 2),
        animationDuration: const Duration(seconds: 2),
      ).show(context);
    }
  }
}
