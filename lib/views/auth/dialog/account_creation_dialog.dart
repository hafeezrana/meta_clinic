import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/login_view.dart';

import '../../widget/my_text_button.dart';
import '../../widget/text_styles.dart';

class AccountCreationDialog extends ConsumerWidget {
  const AccountCreationDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: SizedBox(
                child: Stack(
                  children: [
                    Image.asset(ImagePath.congrats),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: const Icon(
                          Icons.check_circle_outline,
                          size: 100,
                          color: ConstColors.lightBlueColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Congratulations',
              textAlign: TextAlign.center,
              style: MyTextStyles.extraLargeText.copyWith(
                color: ConstColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Congratulations, your account has been\nsuccessfully created.',
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
              title: 'Start',
              onTap: () {
                Appnav.pushReplacemend(context, LoginView());
              },
            )
          ],
        ),
      ),
    );
  }
}
