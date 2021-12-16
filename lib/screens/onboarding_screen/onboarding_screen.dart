import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/screens/pages/dashboard.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0),
            child: Lottie.asset("assets/animations/1.json"),
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: Text(
                'SECURED BACKUP',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(25),
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              'Keep your files in closed safe so you can\'t lose them',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/2.json"),
          Center(
            child: Text(
              'CHANGE AND RISEs',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Give others access to any file or folder you choose',
            style: pageInfoStyle,
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/3.json"),
          Center(
            child: Text(
              'EASY ACCESS',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            'Reach your files anytime from any devices anywhere',
            style: pageInfoStyle,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        isSkippable: true,
        proceedButtonStyle: ProceedButtonStyle(
          proceedButtonRoute: (context) {
            return Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return DashBoardScreen();
            }));
          },
        ),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
      ),
    );
  }
}
