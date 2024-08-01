import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/login_view.dart';
import 'package:meta_clinic/views/home/home_view.dart';
import 'package:meta_clinic/views/widget/appbar.dart';

import '../widget/my_text_button.dart';
import '../widget/text_styles.dart';

class SampleSubmitDialog extends ConsumerWidget {
  SampleSubmitDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'Home Sampling'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: ConstColors.lightBlueColor,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Thank You',
            textAlign: TextAlign.center,
            style: MyTextStyles.extraLargeText.copyWith(
              color: ConstColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              'Your request is submitted',
              textAlign: TextAlign.center,
              style: MyTextStyles.smallText.copyWith(
                color: ConstColors.lightBlueColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Text(
            'Our team will review your request, and contact you to confirm.',
            textAlign: TextAlign.center,
            style: MyTextStyles.smallText.copyWith(
              color: ConstColors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.h),
          MyTextButton(
            width: Get.width * 0.4,
            title: 'Back to Home',
            onTap: () {
              Appnav.pushReplacemend(context, HomeView());
            },
          )
        ],
      ),
    );
  }
}
