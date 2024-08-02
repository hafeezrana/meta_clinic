import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/views/widget/appbar.dart';

import '../widget/icon_button.dart';
import '../widget/search_field.dart';
import '../widget/text_styles.dart';
import 'widget/doctor_card.dart';

class SpecialistListView extends ConsumerWidget {
  const SpecialistListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBackButton(),
                SizedBox(
                  width: Get.width * 0.8,
                  child: const SearchField(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Heart Specialist',
                  textAlign: TextAlign.start,
                  style: MyTextStyles.mediumText,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const DoctorCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
