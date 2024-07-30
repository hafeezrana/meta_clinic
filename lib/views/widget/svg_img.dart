import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_clinic/utils/colors_const.dart';

class SvgImage extends StatelessWidget {
  SvgImage({required this.iconPath, super.key});
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      // // color: Colors.red,
      // width: 70,
      // height: 70,
    );
  }
}
