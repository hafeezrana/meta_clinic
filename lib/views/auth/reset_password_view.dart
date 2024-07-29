import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/auth/login_view.dart';

import '../../utils/navigation.dart';
import '../widget/my_text_button.dart';
import '../widget/reusbale_text_ffield.dart';
import '../widget/text_styles.dart';

class ResetPasswordView extends ConsumerWidget {
  ResetPasswordView({super.key});

  final newPassController = TextEditingController();
  final repeatPassController = TextEditingController();
  bool passChange = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: passChange
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset Password',
                    textAlign: TextAlign.center,
                    style: MyTextStyles.extraLargeText.copyWith(
                      color: ConstColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Create your new password so you can login to your account',
                    textAlign: TextAlign.center,
                    style: MyTextStyles.smallText.copyWith(
                      color: ConstColors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ReusableTextField(
                    prefixIcon: Icons.lock,
                    controller: newPassController,
                    suffixIcon: const Icon(
                      Icons.visibility,
                      size: 27,
                      color: ConstColors.lightBlueColor,
                    ),
                    hintText: "Password",
                  ),
                  ReusableTextField(
                    prefixIcon: Icons.lock,
                    controller: repeatPassController,
                    suffixIcon: const Icon(
                      Icons.visibility,
                      size: 27,
                      color: ConstColors.lightBlueColor,
                    ),
                    hintText: "Repeat Password",
                  ),
                  SizedBox(height: 16.h),
                  MyTextButton(
                    width: Get.width * 0.8,
                    title: 'Reset Password',
                    onTap: () {},
                  )
                ],
              )
            : Center(
                child: SizedBox(
                  height: Get.height * 0.3,
                  width: Get.width * 0.7,
                  child: Card(
                    color: ConstColors.whiteColor,
                    elevation: 8,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.check_circle_outline,
                            size: 100,
                            color: ConstColors.lightBlueColor,
                          ),
                        ),
                        Text(
                          'Password Changed',
                          textAlign: TextAlign.center,
                          style: MyTextStyles.extraLargeText.copyWith(
                            color: ConstColors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Your password has been changed. Please login to proceed',
                          textAlign: TextAlign.center,
                          style: MyTextStyles.smallText.copyWith(
                            color: ConstColors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            child: MyTextButton(
                              width: Get.width * 0.4,
                              title: 'Sign In',
                              onTap: () {
                                Appnav.pushAndRemoveUntil(context, LoginView());
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
