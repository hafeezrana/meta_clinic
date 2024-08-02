import 'package:flutter/material.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';

class MyBackButton extends StatelessWidget {
  MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const CircleAvatar(
        backgroundColor: ConstColors.lightBlueColor,
        radius: 17,
        child: Icon(
          Icons.arrow_back,
          size: 25,
          color: ConstColors.whiteColor,
        ),
      ),
    );
  }
}
