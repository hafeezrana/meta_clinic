import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../widget/text_styles.dart';

class BranchView extends ConsumerWidget {
  const BranchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 27,
                          color: ConstColors.lightBlueColor,
                        ),
                        SizedBox(width: 10.w),
                        SizedBox(
                          width: Get.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home Medical Center, Iqbal Town, Lahore',
                                maxLines: 2,
                                style: MyTextStyles.mediumText
                                    .copyWith(color: ConstColors.black),
                              ),
                              Text(
                                '11 Test included',
                                style: MyTextStyles.smallText.copyWith(
                                  color: ConstColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.call,
                          size: 27,
                          color: ConstColors.lightBlueColor,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '0300 1234567',
                          style: MyTextStyles.smallText.copyWith(
                            color: ConstColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
