import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.borderRadius,
    this.counterText,
    this.maxLines,
    this.color,
    this.obscureText = false,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.onChanged,
    this.validator,
    this.contentPadding, // Add a contentPadding parameter
    this.borderSide = const BorderSide(), // Add a default value
    this.enabledBorder, // Include enabledBorder property in the constructor
    this.hintStyle,
    this.borderColor, // Add a new optional parameter for border color
    this.enable, // New property for enabling/disabling the TextFormField


  }) : super(key: key);

  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? fillColor;
  final double? borderRadius;
  final String? counterText;
  final int? maxLines;
  final Color? color;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator; // Define the validator function
  final EdgeInsets? contentPadding; // Add contentPadding property to the constructor
  final BorderSide? borderSide;
  final InputBorder? enabledBorder; // Include InputBorder for enabledBorder
  final TextStyle? hintStyle; // Include hintStyle property
  final Color? borderColor; // New optional parameter for border color
  final bool? enable;


  @override
  State<CustomTextFormFieldWidget> createState() => _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formKey,
      controller: widget.controller,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator:widget.validator, // Set the validator function
      enabled: widget.enable, // Set the enabled property
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        // ?? EdgeInsets.fromLTRB(10, 10, 10, 0), // Use the provided contentPadding or default value
        fillColor: widget.color,
        filled: widget.fillColor,
        hintText: widget.hint,
        hintStyle: widget.hintStyle, // Apply the provided hintStyle
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        counterText: widget.counterText,
        enabledBorder: widget.enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.grey, // Use borderColor if provided, else use default color
              ),
            ),
        border: widget.borderSide != null
            ? OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(widget.borderRadius ?? 30.r),
          borderSide: widget.borderSide!,
        )
            : null,
      ),
    );
  }
}
