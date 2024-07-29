import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/otp_verification_view.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';
import 'package:meta_clinic/views/widget/reusbale_text_ffield.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../../utils/colors_const.dart';
import '../widget/pinfield.dart';

class ForgotPassView extends ConsumerWidget {
  ForgotPassView({super.key});

  final phoneNumControlller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              textAlign: TextAlign.center,
              style: MyTextStyles.extraLargeText.copyWith(
                color: ConstColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'No worries, we will send you OTP code',
              textAlign: TextAlign.center,
              style: MyTextStyles.smallText.copyWith(
                color: ConstColors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone number:',
                textAlign: TextAlign.start,
                style: MyTextStyles.smallText.copyWith(
                  color: ConstColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ReusableTextField(
              prefixIcon: Icons.call,
              controller: phoneNumControlller,
              hintText: "Enter your phone number",
            ),
            SizedBox(height: 16.h),
            MyTextButton(
              width: Get.width * 0.65,
              title: 'Send OTP',
              onTap: () {
                Appnav.push(context, OtpVerificationView(source: 3));
              },
            )
          ],
        ),
      ),
    );
  }
}
