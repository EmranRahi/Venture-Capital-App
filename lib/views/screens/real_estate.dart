import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:venture_capital_app/views/customs_widgets/custom_button.dart';
import 'package:venture_capital_app/views/screens/dubai_DSA.dart';
import 'package:venture_capital_app/views/screens/thank_you_screen.dart';

import '../customs_widgets/constant_color.dart';
import '../customs_widgets/custom_containers_design.dart';
import '../customs_widgets/custom_text.dart';
import '../customs_widgets/custom_textfield.dart';

class RealEstateScreen extends StatefulWidget {
  const RealEstateScreen({super.key});

  @override
  State<RealEstateScreen> createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isOtherSelected = false;

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('David', 15, color: greenColor),
      _ChartData('Steve', 60, color: darkBlue),
      _ChartData('Jack', 25, color: yellowColor),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }


  void _showInterestDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Make the background transparent
      isScrollControlled: true, // Enable scroll controlled
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.5, // Set initial size to half of the screen
              minChildSize: 0.25, // Minimum size to a quarter of the screen
              maxChildSize: 0.9, // Maximum size to nearly the full screen
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: darkBlue, // Your desired dark blue color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          CustomText(
                            title: "Interest",
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            googleFont: "Inter",
                            fontSize: 30,
                          ),
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: CustomContainer(
                                    height: ScreenUtil().setHeight(30.h),
                                    ontap: () {
                                      setModalState(() {
                                        // Set the selected option
                                        if (index == 0) {
                                          isMaleSelected = true;
                                          isFemaleSelected = false;
                                          isOtherSelected = false;
                                          print("Need More Information");
                                        } else if (index == 1) {
                                          isMaleSelected = false;
                                          isFemaleSelected = true;
                                          isOtherSelected = false;
                                          print("I Invest 10%");
                                        } else if (index == 2) {
                                          isMaleSelected = false;
                                          isFemaleSelected = false;
                                          isOtherSelected = true;
                                          print("Other");
                                        }
                                      });
                                    },
                                    color: (index == 0 && isMaleSelected) ||
                                        (index == 1 && isFemaleSelected) ||
                                        (index == 2 && isOtherSelected)
                                        ? Color(0xff009D10)
                                        : Colors.white,
                                    rd: 30,
                                    child: CustomText(
                                      title: index == 0
                                          ? "Need More Information"
                                          : index == 1
                                          ? "I Invest 10%"
                                          : "I Invest 25%",
                                      color: (index == 0 && isMaleSelected) ||
                                          (index == 1 && isFemaleSelected) ||
                                          (index == 2 && isOtherSelected)
                                          ? Colors.white
                                          : Colors.black,
                                      googleFont: "Inter",
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                height: ScreenUtil().setHeight(30.h),
                                width: MediaQuery.of(context).size.width / 2 - 30,
                                ontap: () {},
                                color: Colors.white,
                                rd: 30,
                                child: CustomText(
                                  title: "I Invest",
                                  color: Colors.black,
                                  googleFont: "Inter",
                                  fontSize: 14.sp,
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(30.h),
                                width: MediaQuery.of(context).size.width / 2 - 30,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: CustomTextFormFieldWidget(
                                  borderRadius: 30,
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
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(15, 20, 5, 0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomText(
                                title: "Type Your Investment",
                                color: Colors.white,
                                googleFont: "Inter",
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Custom_Button_Widget(
                            ontap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ThankYouScreen()));
                            },
                            rd: 30,
                            color: whiteColor,
                            child: CustomText(
                              title: "Done",
                              fontWeight: FontWeight.bold,
                              color: darkBlue,
                              fontSize: 16,
                              googleFont: "Inter",
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
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
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset("assets/images/vrmenu.png", scale: 1.5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomText(
              title: "Real Estate Pakistan",
              color: darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  title: "Highlights",
                  color: blackColor,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: const [
                  WidgetSpan(
                    child: SizedBox(width: 10), // Added space between lines
                  ),
                  TextSpan(
                    text: '\u2022 ', // Unicode for bullet point
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Project Location Dubai',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 15), // Added space between lines
                  ),
                  TextSpan(
                    text: '\u2022 ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: ' Finance Required 2M AED (${"544,000)"}\n',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 10), // Added space between lines
                  ),
                  TextSpan(
                    text: '\u2022 ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Number of investor needed, 2',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 10), // Added space between lines
                  ),
                  TextSpan(
                    text: '\u2022 ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'ROI 15%, Paid Monthly',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  title: "Interest status",
                  color: blackColor,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 140,
                    width: 160,
                    child: SfCircularChart(
                      legend: Legend(),
                      tooltipBehavior: _tooltip,
                      margin: EdgeInsets.all(0.5),
                      series: <CircularSeries<_ChartData, String>>[
                        DoughnutSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          pointColorMapper: (_ChartData data, _) => data.color,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                            textStyle: TextStyle(
                                fontSize: 08,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          name: 'Gold',
                        )
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: '\u2022 ', // Unicode for bullet point
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: greenColor,
                            fontSize: 20),
                      ),
                      TextSpan(
                        text: 'Investor 15%\n',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: '\u2022 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellowColor,
                            fontSize: 20),
                      ),
                      TextSpan(
                        text: 'Interest Shown 25%\n',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextSpan(
                        text: '\u2022 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                            fontSize: 20),
                      ),
                      TextSpan(
                        text: 'Interest Needed 60%',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  title: "Description",
                  color: blackColor,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                )),
            SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  title:
                      "Get involved in a thrilling high-rise real estate project in Pakistan, where we need 25 crore PKR to fund an inventory worth 30 crore PKR. Whether you're an individual investor or part of a fund, this is your chance to be part of a promising venture in Pakistan's vibrant property market.",
                  color: blackColor,
                  fontStyle: FontStyle.italic,
                  maxLine: 6,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Custom_Button_Widget(
                    height: 40,
                    ontap: () {
                      Navigator.pop(context);
                    },
                    rd: 14,
                    color: darkBlue,
                    child: CustomText(
                      title: "Back",
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      googleFont: "Inter",
                      fontSize: 14,
                    )),
                Custom_Button_Widget(
                    height: 40,
                    ontap: () {
                      _showInterestDialog();
                    },
                    rd: 14,
                    color: darkBlue,
                    child: CustomText(
                      title: "Interest ",
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      googleFont: "Inter",
                      fontSize: 14,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, {required this.color});
  final String x;
  final double y;
  final Color color;
}
