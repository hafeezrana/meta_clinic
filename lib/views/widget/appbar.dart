import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/home/home_view.dart';

import 'text_styles.dart';

customAppBar({String? title, List<Widget>? action}) {
  return AppBar(
    backgroundColor: ConstColors.lightBlueColor,
    leading: GestureDetector(
      onTap: () {
        Appnav.pushReplacemend(Get.context!, const HomeView());
      },
      child: const Icon(
        Icons.home_filled,
        color: ConstColors.whiteColor,
      ),
    ),
    title: Text(
      title ?? '',
      style:
          MyTextStyles.extraLargeText.copyWith(color: ConstColors.whiteColor),
    ),
    centerTitle: true,
    actions: action,
  );
}
