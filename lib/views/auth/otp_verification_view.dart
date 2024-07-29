import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/auth/reset_password_view.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../../utils/colors_const.dart';
import '../home/home_view.dart';
import '../widget/pinfield.dart';
import 'dialog/account_creation_dialog.dart';

class OtpVerificationView extends ConsumerWidget {
  OtpVerificationView({required this.source, super.key});
  int source; // 1 = login, 2 = sign up, 3 = forgot pass

  final pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify phone number',
              textAlign: TextAlign.center,
              style: MyTextStyles.extraLargeText.copyWith(
                color: ConstColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'We have sent you a 5-digit code. Please enter here to verify your number',
              textAlign: TextAlign.center,
              style: MyTextStyles.smallText.copyWith(
                color: ConstColors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12.h),
            ReusablePinCodeField(
              pinFieldController: pinCodeController,
              onCompleted: (v) {},
            ),
            Text(
              "Don't receive code? Click to resend.",
              style: MyTextStyles.smallText.copyWith(
                color: ConstColors.black,
              ),
            ),
            SizedBox(height: 16.h),
            MyTextButton(
              width: Get.width * 0.4,
              title: 'Verify',
              onTap: () {
                if (source == 1) {
                  Appnav.push(context, const HomeView());
                } else if (source == 2) {
                  Appnav.push(context, const AccountCreationDialog());
                } else if (source == 3) {
                  Appnav.push(context, ResetPasswordView());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
