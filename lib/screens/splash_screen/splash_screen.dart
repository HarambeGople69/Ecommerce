import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/authentication_screen/authentication_screen.dart';
import 'package:myapp/screens/onboarding_screen/onboarding_screen.dart';
import 'package:myapp/screens/pages/dashboard.dart';
import 'package:myapp/screens/splash_screen/outer_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? done;
  int? auth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGoogleAuthData().whenComplete(() {
      getValidationData().whenComplete(() {
        Timer(
          Duration(seconds: 2),
          done == null ? completed : loginpage,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {

     

    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.cover,
        height: ScreenUtil().setSp(250),
        width: ScreenUtil().setSp(250),
      )),
    );
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedDone = sharedPreferences.getInt("done");

    setState(() {
      done = obtainedDone;
    });
  }

  Future getGoogleAuthData() async {
    print("Hello inside getGoogleAuthData");
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedDone = sharedPreferences.getInt("auth");

    setState(() {
      auth = obtainedDone;
    });
  }

  void completed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ),
    );
  }

  void loginpage() {
    if (auth == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      if (auth == 1) {
        print("Already authenticated ====================");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
      } else if (auth == 0) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    }
  }
}
