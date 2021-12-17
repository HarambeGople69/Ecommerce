import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/screens/authentication_screen/authentication_screen.dart';
import 'package:myapp/screens/pages/dashboard.dart';
import 'package:myapp/shared_preference_service/once_onboarding_service.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';

class GoogleAuth {
  signIn(BuildContext context) async {
    print("===============");
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        OnceOnboarding().googlelogin();
        OurToast().showSuccessToast("User authenticated successfully");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return DashBoard();
        }));
      });
    } on FirebaseAuthException catch (e) {
      OurToast().showErrorToast(e.message!);
    }
  }

  logout(BuildContext context) async {
    try {
      // await FirebaseAuth.instance.signOut();
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut().then((value) {
        OnceOnboarding().googlelogout();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      });
    } on FirebaseAuthException catch (e) {
      OurToast().showErrorToast("Error occured");
    }
  }
}
