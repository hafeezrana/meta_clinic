import 'package:flutter/material.dart';

import '../../utils/colors_const.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    this.textDirection,
    this.controller,
    this.onChanged,
    this.title,
    this.label,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.keyBoardType,
    this.isEnable,
    this.onTap,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.suffixIcon,
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
  int? minLines;
  TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          TextFormField(
            key: key,
            enabled: isEnable,
            focusNode: focusNode,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            minLines: minLines,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
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
                borderSide: BorderSide(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  width: 3.0,
                ),
              ),
              enabledBorder: disableBorder == true
                  ? const OutlineInputBorder(borderSide: BorderSide.none)
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
                    ),
              disabledBorder: disableBorder == true
                  ? const OutlineInputBorder(borderSide: BorderSide.none)
                  : const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.black54, width: 1),
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
                      borderSide: BorderSide(color: ConstColors.grey, width: 1),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
