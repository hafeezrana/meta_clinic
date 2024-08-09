import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/my_text_button.dart';

import '../widget/icon_button.dart';
import '../widget/text_styles.dart';
import 'form_view.dart';

class SpecialistProfileView extends ConsumerWidget {
  SpecialistProfileView({super.key});
  String selectedDate = '';
  String selectedTime = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedDate = ref.watch(isDateViewProvider);
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: customAppBar(title: 'Appointment'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: !isSelectedDate
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyBackButton(),
                        const Text(
                          'Appointment',
                          style: MyTextStyles.largeText,
                        ),
                        const SizedBox()
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 105,
                            color: ConstColors.lightBlueColor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Dr Rubina Asad',
                                style: MyTextStyles.extraLargeText,
                              ),
                              Text(
                                'Cardio Specialist, MBBS',
                                style: MyTextStyles.mediumText,
                              ),
                              Text(
                                '15 Years Experience, 2000 PKR fee',
                                style: MyTextStyles.smallText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'About Dr Rubina Asad',
                        style: MyTextStyles.largeText,
                      ),
                    ),
                    const Text(
                      '''
              Professor of Cardiology. Lahore University. Lahore, Pakistan. Senior Consultant Cardiologist-Home Medical Center Hospital Lahore-Pakistan
                ''',
                      style: MyTextStyles.mediumText,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20.h),
                    MyTextButton(
                      title: 'Book an Appointment',
                      onTap: () {
                        ref.watch(isDateViewProvider.notifier).state = true;
                      },
                    )
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            ref.watch(isDateViewProvider.notifier).state =
                                false;
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: ConstColors.red,
                            size: 28,
                          ),
                        ),
                        const Text(
                          'Select date and time',
                          style: MyTextStyles.largeText,
                        ),
                        const SizedBox()
                      ],
                    ),
                    DatePickerDialog(
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      selectableDayPredicate: (date) {
                        selectedDate = DateTime(date.year, date.month, date.day)
                            .toString();
                        print('selected date: $selectedDate');
                        return true;
                      },
                    ),
                    SizedBox(height: 6.h),
                    const Text(
                      'Appointment',
                      style: MyTextStyles.largeText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (cont, index) {
                              return const Card(
                                color: ConstColors.whiteColor,
                                elevation: 6,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '08:00 AM',
                                      style: MyTextStyles.smallText,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    MyTextButton(
                      title: 'Set an Appointment',
                      onTap: () {
                        Appnav.push(context, const AppointmentFormView());
                      },
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

final isDateViewProvider = StateProvider<bool>((ref) {
  return false;
});
