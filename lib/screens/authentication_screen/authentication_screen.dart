import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/services/google_authentication_service.dart/google_authentication_service.dart';
import 'package:myapp/shared_preference_service/once_onboarding_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool authenticated = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OnceOnboarding().done();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: authenticated,
        child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(20),
                vertical: ScreenUtil().setSp(10),
              ),
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white.withOpacity(0.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: ScreenUtil().setSp(200),
                      width: ScreenUtil().setSp(200),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        authenticated = true;
                      });
                      await GoogleAuth().signIn(context);
                      setState(() {
                        authenticated = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                        vertical: ScreenUtil().setSp(5),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: ScreenUtil().setSp(50),
                            width: ScreenUtil().setSp(50),
                          ),
                          Text(
                            "Sign in with google",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.white,
                            ),
                          ),
                          Opacity(
                            opacity: 0,
                            child: Image.asset(
                              "assets/images/google.png",
                              height: ScreenUtil().setSp(50),
                              width: ScreenUtil().setSp(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
