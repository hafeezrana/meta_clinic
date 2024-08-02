import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/appointment/specialists_view.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/search_field.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import 'doctors_list_view.dart';

class AppointmentMenuView extends ConsumerStatefulWidget {
  const AppointmentMenuView({super.key});

  @override
  ConsumerState createState() => _AppointmentMenuViewState();
}

class _AppointmentMenuViewState extends ConsumerState<AppointmentMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: const Text(
                'Find Your Doctor',
                style: MyTextStyles.extraLargeText,
              ),
            ),
            const SearchField(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select',
                  textAlign: TextAlign.start,
                  style: MyTextStyles.mediumText,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.11,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Appnav.push(context, const SpecialistListView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ConstColors.whiteColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: ConstColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(1.5, 2),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                ImagePath.heart,
                                // scale: 5,
                              ),
                              Text(
                                'Cardiology',
                                style: MyTextStyles.smallText.copyWith(
                                    color: ConstColors.lightBlueColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Doctors',
                    style: MyTextStyles.largeText,
                  ),
                  InkWell(
                    onTap: () {
                      Appnav.push(context, const DoctorsListView());
                    },
                    child: const Text(
                      'see all',
                      style: MyTextStyles.mediumText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.6,
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 6 / 6.5,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: ConstColors.whiteColor,
                    elevation: 6,
                    child: Column(
                      children: [
                        SizedBox(height: 6.h),
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          color: ConstColors.whiteColor,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              'https://media.istockphoto.com/id/1413129950/vector/avatar-of-woman-doctor-with-brown-hair-doctor-with-stethoscope-vector-illustration.jpg?s=612x612&w=0&k=20&c=J62PxR-p5QeTpqgk-5C8naTrbZdBUnhuxh6sub1YpBg=',
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Dr. Zaibun Nisa',
                          style: MyTextStyles.largeText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                        Text(
                          'Cardiology Specialist',
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: MyTextStyles.extraSmallText.copyWith(
                              color: ConstColors.lightBlueColor,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Center(
                            child: RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 16,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Center(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
