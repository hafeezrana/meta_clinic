import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/reusbale_text_ffield.dart';

import '../widget/icon_button.dart';
import '../widget/text_styles.dart';

class AppointmentFormView extends ConsumerWidget {
  const AppointmentFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBackButton(),
                const Text(
                  'Patient Details',
                  style: MyTextStyles.largeText,
                ),
                const SizedBox()
              ],
            ),
            SizedBox(height: 4.h),
            ReusableTextField(
              hintText: 'Enter Patient Name',
            )
          ],
        ),
      ),
    );
  }
}
