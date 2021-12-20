import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/splash_screen/outer_wrapper.dart';
import 'package:myapp/screens/splash_screen/splash_screen.dart';
import 'package:myapp/services/card_management/cart_management.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();
//   runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => MyApp(), // Wrap your app
//   ),
// );
// }

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
            useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.dark),
            // ignore: prefer_const_constructors

            home: SplashScreen(),
          ),
        );
      }),
    );
  }
}
