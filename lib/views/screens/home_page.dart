import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:venture_capital_app/views/customs_widgets/constant_color.dart';
import 'package:venture_capital_app/views/customs_widgets/custom_containers_design.dart';
import 'package:venture_capital_app/views/screens/real_estate.dart';

import '../customs_widgets/custom_text.dart';
import '../customs_widgets/custom_textfield.dart';
import 'dubai_DSA.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  final List<String> items = [
    'DSA Dubai',
    'Real Estate Pakistan',
    'DSA Dubai',
    'Real Estate Pakistan',
    'DSA Dubai',
    'Real Estate Pakistan',
    'DSA Dubai',
    'Real Estate Pakistan',
  ];

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0), // changes the shadow direction
                    ),
                  ],
                ),
                child: CustomTextFormFieldWidget(
                  borderRadius: 30,
                  hint: "Search",
                  prefixIcon: Icon(Icons.search),
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
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.fromLTRB(15, 20, 5, 0),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 2),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      title: "Projects",
                      color: darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
              ),
              SizedBox(
                height: 8.h,
              ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.all(0.1),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: CustomContainer(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 2.80,
                    color: Colors.white,
                    boxShadow: true,
                    boxShadowColor: Colors.grey.withOpacity(0.3),
                    boxShadowBlurRadius: 2,
                    boxShadowOffset: Offset(0, 0),
                    boxShadowSpreadRadius: 2,
                    ontap: () {
                      // Navigate based on index
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DSADubaiScreen()),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RealEstateScreen()),
                        );
                      } else {
                        // Default action or navigation for other indexes
                      }
                    },
                    rd: 20,
                    child: Column(
                      children: [
                        CustomText(
                          title: items[index].toString(),
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              title: "Highlights",
                              color: Colors.black,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: const [
                              WidgetSpan(
                                child: SizedBox(width: 10),
                              ),
                              TextSpan(
                                text: '\u2022 ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Project Location Dubai',
                                style: TextStyle(color: Colors.black, fontSize: 10),
                              ),
                              WidgetSpan(
                                child: SizedBox(width: 15),
                              ),
                              TextSpan(
                                text: '\u2022 ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(
                                text: ' Finance Required 2M AED (${"544,000)"}\n',
                                style: TextStyle(color: Colors.black, fontSize: 10),
                              ),
                              WidgetSpan(
                                child: SizedBox(width: 10),
                              ),
                              TextSpan(
                                text: '\u2022 ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Number of investor needed, 2',
                                style: TextStyle(color: Colors.black, fontSize: 10),
                              ),
                              WidgetSpan(
                                child: SizedBox(width: 10),
                              ),
                              TextSpan(
                                text: '\u2022 ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'ROI 15%, Paid Monthly',
                                style: TextStyle(color: Colors.black, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              title: "Interest status",
                              color: Colors.black,
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
                                          fontSize: 8,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      name: 'Gold',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\u2022 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Investor 15%\n',
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '\u2022 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Interest Shown 25%\n',
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '\u2022 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CustomText(
                              title: "Details >",
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
              // CustomContainer(
              //     // width: 327,
              //   width: MediaQuery.of(context).size.width/1.1,
              //     height: MediaQuery.of(context).size.height/2.80,
              //     color: whiteColor,
              //     boxShadow: true,
              //     boxShadowColor:Colors.grey.withOpacity(0.3),
              //     boxShadowBlurRadius: 2,
              //     boxShadowOffset:  Offset(0, 0),
              //     boxShadowSpreadRadius: 2,
              //     ontap: (){}, rd: 20, child: Column(children: [
              //   CustomText(
              //     title: "DSA Dubai",
              //     color: darkBlue,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 15,
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 4.0),
              //     child: Align(
              //       alignment: Alignment.topLeft,
              //       child: CustomText(
              //         title: "Highlights",
              //         color: blackColor,
              //         fontSize: 12,
              //         fontStyle: FontStyle.italic,
              //       ),
              //     ),
              //   ),
              //   SizedBox(height: 10,),
              //   RichText(
              //     text: TextSpan(
              //       children: const [
              //         WidgetSpan(
              //           child: SizedBox(width: 10), // Added space between lines
              //         ),
              //         TextSpan(
              //           text: '\u2022 ', // Unicode for bullet point
              //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              //         ),
              //         TextSpan(
              //           text: 'Project Location Dubai',
              //           style: TextStyle(color: Colors.black,fontSize: 10),
              //         ),
              //         WidgetSpan(
              //           child: SizedBox(width: 15), // Added space between lines
              //         ),
              //         TextSpan(
              //           text: '\u2022 ',
              //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              //         ),
              //         TextSpan(
              //           text: ' Finance Required 2M AED (${"544,000)"}\n',
              //           style: TextStyle(color: Colors.black,fontSize: 10),
              //         ),
              //         WidgetSpan(
              //           child: SizedBox(width: 10), // Added space between lines
              //         ),
              //         TextSpan(
              //           text: '\u2022 ',
              //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              //         ),
              //         TextSpan(
              //           text: 'Number of investor needed, 2',
              //           style: TextStyle(color: Colors.black,fontSize: 10),
              //         ),
              //         WidgetSpan(
              //           child: SizedBox(width: 10), // Added space between lines
              //         ),
              //         TextSpan(
              //           text: '\u2022 ',
              //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              //         ),
              //         TextSpan(
              //           text: 'ROI 15%, Paid Monthly',
              //           style: TextStyle(color: Colors.black,fontSize: 10),
              //         ),
              //       ],
              //     ),
              //   ),
              //   SizedBox(height: 10,),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 5.0),
              //     child: Align(
              //       alignment: Alignment.topLeft,
              //       child: CustomText(
              //         title: "Interest status",
              //         color: blackColor,
              //         fontSize: 12,
              //         fontStyle: FontStyle.italic,
              //       ),
              //     ),
              //   ),
              //   Row(
              //     children: [
              //       Align(
              //         alignment: Alignment.topLeft,
              //         child: SizedBox(
              //           height: 140,
              //           width: 160,
              //           child: SfCircularChart(
              //             legend: Legend(),
              //             tooltipBehavior: _tooltip,
              //             margin: EdgeInsets.all(0.5),
              //             series: <CircularSeries<_ChartData, String>>[
              //               DoughnutSeries<_ChartData, String>(
              //                 dataSource: data,
              //                 xValueMapper: (_ChartData data, _) => data.x,
              //                 yValueMapper: (_ChartData data, _) => data.y,
              //                 pointColorMapper: (_ChartData data, _) => data.color,
              //                 dataLabelSettings: DataLabelSettings(
              //                   isVisible: true,
              //                   labelPosition: ChartDataLabelPosition.inside,
              //                   textStyle: TextStyle(fontSize: 08, color: Colors.white,fontWeight: FontWeight.bold),
              //                 ),
              //                 name: 'Gold',
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       RichText(
              //         text: TextSpan(
              //           children: const [
              //             TextSpan(
              //               text: '\u2022 ', // Unicode for bullet point
              //               style: TextStyle(fontWeight: FontWeight.bold, color: greenColor,fontSize: 20),
              //             ),
              //             TextSpan(
              //               text: 'Investor 15%\n',
              //               style: TextStyle(color: Colors.black,fontSize: 16),
              //             ),
              //
              //             TextSpan(
              //               text: '\u2022 ',
              //               style: TextStyle(fontWeight: FontWeight.bold, color: yellowColor,fontSize: 20),
              //             ),
              //             TextSpan(
              //               text: 'Interest Shown 25%\n',
              //               style: TextStyle(color: Colors.black,fontSize: 16),
              //             ),
              //             TextSpan(
              //               text: '\u2022 ',
              //               style: TextStyle(fontWeight: FontWeight.bold, color: darkBlue,fontSize: 20),
              //             ),
              //             TextSpan(
              //               text: 'Interest Needed 60%',
              //               style: TextStyle(color: Colors.black,fontSize: 16),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              //  Padding(
              //     padding: const EdgeInsets.only(right: 10),
              //     child: Align(
              //         alignment: Alignment.bottomRight,
              //         child: CustomText(title: "Details >",color: grayColor2,)),
              //   )
              // ],
              //  ),
              // ),
            ],
          ),
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
