import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../specialist_profile_view.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: ConstColors.whiteColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dr. Zaibun Nisa',
                          style: MyTextStyles.largeText
                              .copyWith(color: ConstColors.lightBlueColor),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: ConstColors.lightBlueColor,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Cardiology Specialist',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: MyTextStyles.smallText.copyWith(
                        color: ConstColors.lightBlueColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: const Text(
                      "I've 8+ years of experience as heart surgeon. And also worked as a Cardio consultant.",
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: MyTextStyles.smallText,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.35,
                          child: RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        Card(
                          elevation: 4,
                          color: ConstColors.lightBlueColor,
                          child: InkWell(
                            onTap: () {
                              Appnav.push(
                                context,
                                SpecialistProfileView(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8.0),
                              child: Text(
                                'View Profile',
                                style: MyTextStyles.extraSmallText
                                    .copyWith(color: ConstColors.whiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
