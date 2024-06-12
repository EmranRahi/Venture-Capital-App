import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venture_capital_app/views/screens/user_name_password.dart';
import '../customs_widgets/constant_color.dart';
import '../customs_widgets/custom_button.dart';
import '../customs_widgets/custom_text.dart';
import '../customs_widgets/custom_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
        resizeToAvoidBottomInset: false,
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgimages.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
            CustomText(
              title: "High Performing",
              googleFont: "Inter",
              fontSize: 30,
              color: darkBlue,
              fontWeight: FontWeight.bold,
            ),
            CustomText(title: "Venture Capital",googleFont: "Inter",fontSize: 16,color: blackColor,fontWeight: FontWeight.bold,),

            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes the shadow direction
                  ),
                ],
              ),
              child: CustomTextFormFieldWidget(
                borderRadius: 30,
                hint: "SigIn",
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
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.fromLTRB(15, 20, 5, 0),
              ),
            ),
            SizedBox(height: 16,),
            Custom_Button_Widget(
              width: MediaQuery.of(context).size.width/1.2,
              rd: 30,
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserNamePassword()));
              },
              color: darkBlue,
              child: CustomText(title: "Sign Up",color: whiteColor,fontSize: 20),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    ));
  }
}
