import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/icon_button.dart';
import 'package:meta_clinic/views/widget/search_field.dart';

import '../appointment/widget/doctor_card.dart';

class FavoriteDoctorsView extends ConsumerWidget {
  const FavoriteDoctorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'My Doctors'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
            SizedBox(height: 10.h),
            SizedBox(
              height: Get.height * 0.8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
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
