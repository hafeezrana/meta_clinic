import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';
import 'package:meta_clinic/views/widget/reusbale_text_ffield.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import 'dialog/terms_ncondition_view.dart';
import 'otp_verification_view.dart';

class SignupView extends ConsumerWidget {
  SignupView({super.key});

  final patientNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  bool securePass = true;
  bool isChecked = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Image.asset(ImagePath.logo2),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Create your account',
                      style: MyTextStyles.extraLargeText.copyWith(
                        color: ConstColors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Please sign up to your account',
                      style: MyTextStyles.smallText.copyWith(
                        color: ConstColors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ReusableTextField(
                      prefixIcon: Icons.account_circle_rounded,
                      hintText: 'Patient name',
                      controller: patientNameController,
                    ),
                    SizedBox(height: 8.h),
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
                    SizedBox(height: 8.h),
                    ReusableTextField(
                      prefixIcon: Icons.lock,
                      hintText: 'Repeat password',
                      controller: passwordRepeatController,
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
                      title: 'Register',
                      onTap: () {
                        Appnav.push(context, OtpVerificationView(source: 2));
                      },
                    ),
                    SizedBox(
                      width: Get.width * 0.7,
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
                              Appnav.push(context, const TermsNconditionView());
                            },
                          ),
                          Text(
                            'Agreed with terms & conditions',
                            style: MyTextStyles.smallText.copyWith(
                              color: ConstColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
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
