import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/splash_screen/outer_wrapper.dart';
import 'package:myapp/screens/splash_screen/splash_screen.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return ScreenUtilInit(
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            // ignore: prefer_const_constructors
            builder: (context, child) {
              return child!;
            },
            home: SplashScreen(),
          ),
        );
      }),
    );
  }
}
