import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/signup_view.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../widget/my_text_button.dart';
import 'login_view.dart';

class AuthFirstView extends ConsumerWidget {
  const AuthFirstView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Image.asset(ImagePath.logo2),
            SizedBox(height: 14.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'We Are Here\nto Serve You!',
                textAlign: TextAlign.center,
                style: MyTextStyles.extraLargeText.copyWith(
                  color: ConstColors.lightBlueColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            MyTextButton(
                title: 'Sign In',
                onTap: () {
                  Appnav.push(context, LoginView());
                }),
            const SizedBox(height: 20),
            MyTextButton(
              title: 'Sign Up',
              onTap: () {
                Appnav.push(context, SignupView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
