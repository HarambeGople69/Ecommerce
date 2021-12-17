import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myapp/screens/authentication_screen/authentication_screen.dart';
import 'package:myapp/screens/pages/dashboard.dart';

class OuterWrapperLogic extends StatefulWidget {
  const OuterWrapperLogic({Key? key}) : super(key: key);

  @override
  _OuterWrapperLogicState createState() => _OuterWrapperLogicState();
}

class _OuterWrapperLogicState extends State<OuterWrapperLogic> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DashBoard();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
