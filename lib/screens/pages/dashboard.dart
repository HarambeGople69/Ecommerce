import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/services/google_authentication_service.dart/google_authentication_service.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: new Container(
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
                    await GoogleAuth().signIn();
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
    );
  }
}
