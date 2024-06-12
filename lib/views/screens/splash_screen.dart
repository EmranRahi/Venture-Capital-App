import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customs_widgets/constant_color.dart';
import '../customs_widgets/custom_text.dart';
import '../splash_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    // Create an instance of SplashServices and call isLogin with the context.
    SplashServices().isLogin(context);

  }



  @override
  Widget build(BuildContext context) {
    // Hide status bar icons by setting the system overlay style
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to transparent
      statusBarIconBrightness: Brightness.dark, // Use dark icons on the status bar
    ),
    );
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgimages.png"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(title: "High Performing",googleFont: "Inter",fontSize: 30,color: darkBlue,fontWeight: FontWeight.bold,),
            CustomText(title: "Venture Capital",googleFont: "Inter",fontSize: 16,color: blackColor,fontWeight: FontWeight.bold,)
          ],
        ),
      )
    );
  }
}
