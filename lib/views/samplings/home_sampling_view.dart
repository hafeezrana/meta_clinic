import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';
import 'package:meta_clinic/views/widget/reusbale_text_ffield.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import 'after_submitsample.dart';

class HomeSamplingView extends StatelessWidget {
  HomeSamplingView({super.key});

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: customAppBar(title: 'Home Sampling'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Home Sampling Collection',
                textAlign: TextAlign.center,
                style: MyTextStyles.extraLargeText.copyWith(),
              ),
            ),
            const Text(
              'HMC Lab is offering free home sample collection services to the patients to help them get tested in the convenience of their homes.',
              style: MyTextStyles.smallText,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 4.h),
            ReusableTextField(
              prefixIcon: Icons.person,
              hintText: "Patient name",
            ),
            SizedBox(height: 4.h),
            ReusableTextField(
              prefixIcon: Icons.call,
              hintText: "Contact number",
            ),
            SizedBox(height: 4.h),
            ReusableTextField(
              prefixIcon: Icons.medication_liquid,
              hintText: "Select Tests",
              suffixIcon: const Icon(
                Icons.arrow_drop_down_sharp,
                size: 37,
                color: ConstColors.lightBlueColor,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.75,
                  child: const Text(
                    'Select an option to upload prescription',
                    style: MyTextStyles.smallText,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.15,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 27,
                        color: ConstColors.lightBlueColor,
                      ),
                      Icon(
                        Icons.add_photo_alternate,
                        size: 27,
                        color: ConstColors.lightBlueColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Card(
              elevation: 8,
              color: ConstColors.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ReusableTextField(
                      elevation: 2,
                      prefixIcon: Icons.location_on_rounded,
                      hintText: "Enter your current address here",
                    ),
                    SizedBox(height: 6.h),
                    MyTextButton(
                      title: 'User my current location',
                      onTap: () {},
                    ),
                    SizedBox(height: 6.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            const Text(
              'Select relevant date and time',
              style: MyTextStyles.smallText,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 8,
                  color: ConstColors.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Select Date',
                          style: MyTextStyles.largeText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.45,
                        child: ReusableTextField(
                          hintText: 'MM/DD/YYYY',
                          elevation: 0,
                          prefixIcon: Icons.calendar_month,
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: ConstColors.whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Time Slot',
                          style: MyTextStyles.largeText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.45,
                        child: ReusableTextField(
                          elevation: 0,
                          hintText: '00:00:00',
                          prefixIcon: Icons.calendar_month,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: Get.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: ConstColors.whiteColor,
                    activeColor: ConstColors.whiteColor,
                    fillColor: MaterialStateProperty.all(ConstColors.blueColor),
                    value: isChecked,
                    onChanged: (value) {
                      isChecked = value!;
                    },
                  ),
                  Text(
                    'I read all terms & conditions and agreed',
                    style: MyTextStyles.smallText.copyWith(
                      color: ConstColors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            MyTextButton(
              title: 'Submit',
              onTap: () {
                Appnav.push(context, SampleSubmitDialog());
              },
            )
          ],
        ),
      ),
    );
  }
}
