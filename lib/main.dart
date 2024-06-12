import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venture_capital_app/testcode.dart';
import 'package:venture_capital_app/views/screens/real_estate.dart';
import 'package:venture_capital_app/views/screens/splash_screen.dart';
import 'package:venture_capital_app/views/screens/thank_you_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // Hide status bar icons by setting the system overlay style
          SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Set the status bar color to transparent
            statusBarIconBrightness: Brightness.light, // Use dark icons on the status bar
           ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  SplashScreen(),
          );
        }
    );
  }
}

