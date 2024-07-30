import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../widget/search_field.dart';

class ReportsView extends ConsumerWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'Online Reports'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Registration No',
                  style: MyTextStyles.mediumText
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'Test Name',
                  style: MyTextStyles.mediumText
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'Sample Date',
                  style: MyTextStyles.mediumText
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'PDF',
                  style: MyTextStyles.mediumText.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Registration No',
                          style: MyTextStyles.smallText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                        Text(
                          'Test Name',
                          style: MyTextStyles.smallText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                        Text(
                          'Sample Date',
                          style: MyTextStyles.smallText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                        const Icon(
                          Icons.picture_as_pdf,
                          size: 28,
                          color: ConstColors.red,
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
