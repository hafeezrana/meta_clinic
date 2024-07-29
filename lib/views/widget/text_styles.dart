import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_clinic/utils/colors_const.dart';

class MyTextStyles {
  static const extraSmallText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: ConstColors.whiteColor,
    // fontFamily: 'Lato Thin',
  );
  static const smallText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,

    color: Colors.black,
    // fontFamily: 'Madimi one',
  );
  static const mediumText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ConstColors.black,
    // fontFamily: 'Madimi One',
  );

  static const largeText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Colors.black,
    // fontFamily: 'Madimi One',
  );
  static const extraLargeText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    // fontFamily: 'Madimi One',
  );
}
