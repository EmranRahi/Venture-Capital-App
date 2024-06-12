import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainer extends StatelessWidget {
  final Widget child;
  final ontap;
  final double? height;
  final double? width;
  final Color? color;
  final Border? border;
  // IconData? icon;
  // BoxShadow properties
  final double boxShadowBlurRadius;
  final double boxShadowSpreadRadius;
  final Offset boxShadowOffset;
  final Color boxShadowColor;

  double rd;
  bool? boxShadow = true;
   CustomContainer({super.key,
     required this.child,
    required this.ontap,
    this.height,
    this.width,
    this.color,
     this.border,
    this.boxShadow,
    required this.rd,
     this.boxShadowBlurRadius = 2.0,
     this.boxShadowSpreadRadius = 2.0,
     this.boxShadowOffset = const Offset(0, 0),
     this.boxShadowColor = const Color(0xffD9CDE7),

});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      highlightColor: Colors.transparent,
       splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        height: height ?? 10,
        width: width ?? 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Color(0xFFE4E4E4),
            borderRadius: BorderRadius.circular(rd.r),
            // border: Border.all(color: CupertinoColors.destructiveRed),
             border: border,
          boxShadow: boxShadow == true
              ? [
            BoxShadow(
              color: boxShadowColor.withOpacity(0.3),
              blurRadius: boxShadowBlurRadius.r,
              spreadRadius: boxShadowSpreadRadius.r,
              offset: boxShadowOffset,
            ),
          ]
              : [],

        ),
        child: child,
      ),
    );
  }
}
