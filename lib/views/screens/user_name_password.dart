import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:venture_capital_app/views/customs_widgets/custom_containers_design.dart';
import 'package:venture_capital_app/views/screens/home_page.dart';

import '../customs_widgets/constant_color.dart';
import '../customs_widgets/custom_button.dart';
import '../customs_widgets/custom_text.dart';
import '../customs_widgets/custom_textfield.dart';

class UserNamePassword extends StatefulWidget {
  const UserNamePassword({super.key});
  @override
  State<UserNamePassword> createState() => _UserNamePasswordState();
}

class _UserNamePasswordState extends State<UserNamePassword> {
  TextEditingController countryController = TextEditingController();
  String phone = "";
  String verificationId = "";
  String btnRasendText = "";
  int start = 30;
  Timer? _timer;
  void handlePhoneChange(String value) {
    if (value.length == 11) {
      setState(() {
        phone = value.substring(1);
        // phoneController.text = phone;
      });
    } else {
      setState(() {
        phone = value;
      });
    }
    print("Phone Value: $phone");
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          btnRasendText = "Resend";
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // Hide status bar icons by setting the system overlay style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Set the status bar color to transparent
            statusBarIconBrightness:
            Brightness.dark, // Use dark icons on the status bar
      ),
    );
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  title: "Sign In",
                  googleFont: "Inter",
                  fontSize: 30,
                  color: darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes the shadow direction
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 23, top: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: CustomText(
                                title: "username*",
                                color: grayColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 0), // changes the shadow direction
                              ),
                            ],
                          ),
                          child: CustomTextFormFieldWidget(
                            borderRadius: 10,
                            hint: "username",
                            hintStyle: TextStyle(
                              fontFamily: "Jost",
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffbababa),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white60,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 0),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23, top: 3),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: CustomText(
                                title: "Password*",
                                color: grayColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 0), // changes the shadow direction
                              ),
                            ],
                          ),
                          child: CustomTextFormFieldWidget(
                            borderRadius: 10,
                            hint: "password",
                            hintStyle: TextStyle(
                              fontFamily: "Jost",
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffbababa),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white60,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.fromLTRB(15, 20, 5, 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () {},
                                  child: CustomText(
                                    title: "Forgot Password?",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ))),
                        ),
                        Custom_Button_Widget(
                          width: MediaQuery.of(context).size.width / 1.2,
                          rd: 10,
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                          color: darkBlue,
                          child: CustomText(
                              title: "Sign Up", color: whiteColor, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 1.2,
                            color: whiteColor,
                            border: Border.all(
                              color: grayColor2
                            ),
                            ontap: () {},
                            rd: 10,
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Image.asset("assets/images/googleimage.png"),
                                SizedBox(
                                  width: 15,
                                ),
                                CustomText(
                                  title: "Sign in with Google",
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 1.2,
                            color: whiteColor,
                            border: Border.all(
                                color: grayColor2
                            ),
                            ontap: () {},
                            rd: 10,
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Image.asset("assets/images/fbimage.png"),
                                SizedBox(
                                  width: 15,
                                ),
                                CustomText(
                                  title: "Sign in with Facebook",
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CustomText(
                            title: "Don’t have an account?",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                            TextButton(
                            onPressed: () {},
                    child: CustomText(
                      title: "Sign up",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                        ],)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
