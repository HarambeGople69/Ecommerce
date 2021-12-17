import 'package:flutter/material.dart';
import 'package:myapp/services/google_authentication_service.dart/google_authentication_service.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoogleAuth().logout(context);
          },
          child: Text("data"),
        ),
      ),
    );
  }
}
