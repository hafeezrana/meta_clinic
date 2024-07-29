import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/signup_view.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';
import 'package:meta_clinic/views/widget/reusbale_text_ffield.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import 'forgot_pass_view.dart';
import 'otp_verification_view.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  bool securePass = true;
  bool isChecked = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ConstColors.lightBlueColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Image.asset(ImagePath.logo),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.85,
              decoration: const BoxDecoration(
                color: ConstColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Welcome back',
                      style: MyTextStyles.extraLargeText.copyWith(
                        color: ConstColors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Please sign in to your account',
                      style: MyTextStyles.smallText.copyWith(
                        color: ConstColors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ReusableTextField(
                      prefixIcon: Icons.call,
                      hintText: 'xxxx-xxxxxxxx',
                      controller: phoneNumberController,
                    ),
                    SizedBox(height: 8.h),
                    ReusableTextField(
                      prefixIcon: Icons.lock,
                      hintText: 'Password',
                      controller: passwordController,
                      obsecureText: securePass,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          securePass = !securePass;
                        },
                        child: Icon(
                          !securePass ? Icons.visibility : Icons.visibility_off,
                          size: 25,
                          color: ConstColors.lightBlueColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyTextButton(
                      title: 'Sign In',
                      onTap: () {
                        Appnav.push(context, OtpVerificationView(source: 1));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: ConstColors.whiteColor,
                                activeColor: ConstColors.whiteColor,
                                fillColor: MaterialStateProperty.all(
                                    ConstColors.blueColor),
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = value!;
                                },
                              ),
                              Text(
                                'Remember me',
                                style: MyTextStyles.smallText.copyWith(
                                  color: ConstColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Appnav.push(context, ForgotPassView());
                          },
                          child: Text(
                            'Forgot password?',
                            style: MyTextStyles.smallText.copyWith(
                                color: ConstColors.lightBlueColor,
                                decoration: TextDecoration.underline,
                                textBaseline: TextBaseline.alphabetic),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Don't have an account?",
                        style: MyTextStyles.smallText.copyWith(
                          color: ConstColors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: GestureDetector(
                          onTap: () {
                            Appnav.push(context, SignupView());
                          },
                          child: Container(
                            width: Get.width * 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ConstColors.lightBlueColor),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'CREATE AN ACCOUNT',
                                  style: MyTextStyles.largeText.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ConstColors.lightBlueColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
