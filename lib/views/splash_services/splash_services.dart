
import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/sign_in_screen.dart';
class SplashServices {
  // Add a parameter to receive the BuildContext.
  void isLogin(BuildContext context) {
    // Use Timer for the delay.
    Timer(Duration(seconds: 5), () {
      // Navigate to the login screen.
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
    });
  }
}
