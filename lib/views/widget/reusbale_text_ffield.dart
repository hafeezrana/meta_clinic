import 'package:flutter/material.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../../utils/colors_const.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    this.textDirection,
    this.controller,
    this.onChanged,
    this.title,
    this.label,
    this.elevation,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.keyBoardType,
    this.isEnable,
    this.hintText,
    this.onTap,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.suffixIcon,
    this.obsecureText,
    this.disableBorder,
    super.key,
  });

  TextDirection? textDirection;
  TextEditingController? controller;
  void Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;
  void Function()? onTap;
  String? Function(String?)? validator;
  String? label;
  String? title;
  IconData? prefixIcon;
  Widget? suffixIcon;
  bool? isEnable;
  FocusNode? focusNode;
  bool? disableBorder;
  int? maxLines;
  bool? obsecureText;
  int? minLines;
  double? elevation;
  String? hintText;
  TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        elevation: elevation ?? 6,
        borderOnForeground: true,
        // surfaceTintColor: Colors.white70.withOpacity(0.6),
        shadowColor: Colors.grey.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        color: ConstColors.whiteColor,

        child: TextFormField(
          key: key,
          enabled: isEnable,
          focusNode: focusNode,
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          minLines: 1,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          // obscureText: obsecureText ?? false,
          keyboardType: keyBoardType,
          style: const TextStyle(
            // fontFamily: 'Cairo',
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,

            isDense: true,
            hintText: hintText,
            prefixIcon: Icon(
                  prefixIcon,
                  size: 25,
                  color: ConstColors.lightBlueColor,
                ) ??
                null,
            hintStyle:
                MyTextStyles.mediumText.copyWith(color: ConstColors.grey),
            suffixIcon: suffixIcon,

            contentPadding: const EdgeInsets.all(6),
            errorStyle: const TextStyle(
              // fontFamily: 'Cairo',
              color: Colors.red,
              fontSize: 14,
            ),
            fillColor: Colors.transparent,
            // labelText: label,
            // hintText: label,
            // label: Center(
            //   child: Text(
            //     label ?? '',
            //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //   ),
            // ),
            labelStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: disableBorder == true
                ? const OutlineInputBorder(borderSide: BorderSide.none)
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(color: Colors.black54, width: 1),
                  ),
            disabledBorder: disableBorder == true
                ? const OutlineInputBorder(borderSide: BorderSide.none)
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    // borderSide: BorderSide(color: Colors.black54, width: 1),
                    borderSide: BorderSide.none,
                  ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            enabled: true,
            focusedBorder: disableBorder == true
                ? const OutlineInputBorder(borderSide: BorderSide.none)
                : const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                    // borderSide:
                    //     BorderSide(color: ConstColors.grey, width: 1),
                  ),
          ),
        ),
      ),
    );
  }
}
