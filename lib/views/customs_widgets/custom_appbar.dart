import 'package:flutter/material.dart';

import 'constant_color.dart';


PreferredSizeWidget customAppBar1({

  bool? centerTitle,
  final Widget? leading,
  final Widget? action,
  final Widget? title,
  final Widget? flexibleSpace,
  double? elevation,
  Color? backgroundColor, // Add this property for custom color

}) {
  return AppBar(
    backgroundColor: backgroundColor ?? whiteColor,
    elevation: elevation,
    flexibleSpace:  flexibleSpace,
    leading: leading,
    title: title,
    centerTitle: centerTitle,
    actions: [
      action ?? SizedBox(),
    ],
  );
}
