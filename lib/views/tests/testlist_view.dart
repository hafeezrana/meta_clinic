import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/search_field.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

class TestlistView extends ConsumerWidget {
  const TestlistView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'All Tests'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 10.h),
            const SearchField(),
            SizedBox(height: 10.h),
            ListView.builder(
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
                            Text(
                              'WBC Count',
                              style: MyTextStyles.largeText
                                  .copyWith(color: ConstColors.lightBlueColor),
                            ),
                            Text(
                              '11 Test included',
                              style: MyTextStyles.smallText.copyWith(
                                color: ConstColors.lightBlueColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: ConstColors.grey),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text('Recommend for: Male, Female'),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '500 PKR',
                              style: MyTextStyles.smallText.copyWith(
                                color: ConstColors.lightBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
