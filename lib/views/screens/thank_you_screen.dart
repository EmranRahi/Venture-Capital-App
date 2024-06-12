import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../customs_widgets/constant_color.dart';
import '../customs_widgets/custom_button.dart';
import '../customs_widgets/custom_text.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    // Hide status bar icons by setting the system overlay style
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color to transparent
      statusBarIconBrightness: Brightness.dark, // Use dark icons on the status bar
    ),
    );
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset("assets/images/vrmenu.png",scale: 1.5),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bgimages.png"),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 30),
          child: Column(
            children: [
               Image.asset('assets/images/thankyou.png',scale: 1.7),
              CustomText(
                title: "Dear Potential Investor,",
                color: blackColor,
                fontWeight: FontWeight.bold,
                googleFont: "Inter",
                fontSize: 15,
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  title: "Best regards,",
                  color: blackColor,
                  googleFont: "Inter",
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 30,),
              CustomText(
                title: "High Performance Computing UK ltd",
                color: blackColor,
                googleFont: "Inter",
                fontSize: 15,
              ),
              Spacer(),
              Custom_Button_Widget(
                ontap: () {},
                rd: 30,
                height: MediaQuery.of(context).size.height/25,
                width: MediaQuery.of(context).size.width/2.4,
                color: darkBlue,
                child: CustomText(
                  title: "Done",
                  color: Colors.white,
                  fontSize: 16,
                  googleFont: "Inter",
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
