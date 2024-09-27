import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../about/aboutus_view.dart';
import '../account/profile_acccount_view.dart';
import '../appointment/appointment_menu_view.dart';
import '../branches/branch_location_view.dart';
import '../reports/reports_view.dart';
import '../samplings/home_sampling_view.dart';
import '../tests/testlist_view.dart';
import '../widget/svg_img.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

final images = [
  'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBn-DeCKVKHm5hZB9-DUtIHL0vLTo4kVuCmg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiIwy0Z4bVsZ6DmlxDnosJLgW9QAssls5lAA&s'
      'https://media.istockphoto.com/id/532394887/photo/medical-students-walking-through-corridor.jpg?s=612x612&w=0&k=20&c=OfgqmhMALUsNwHvTj9Tds56C7boSpb6Yt8ZwCuFIzIw='
];

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: customAppBar(title: 'Home', action: [
        GestureDetector(
          onTap: () {
            Appnav.push(context, const ProfileView());
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 27,
            ),
          ),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi Doctor Flutter',
                  style: MyTextStyles.largeText,
                ),
              ],
            ),
            SizedBox(height: 4.h),

            CarouselSlider(
              items: images
                  .map((ind) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          ind,
                          fit: BoxFit.fill,
                          width: Get.width,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 160.h,
                aspectRatio: 16 / 14,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),

            SizedBox(height: 12.h),
            GridView.builder(
              itemCount: cardsData.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 8.sp,
                childAspectRatio: 8 / 6,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index > 5) {
                      ref.read(indexProvider.notifier).state = null;
                    }
                    ref.read(indexProvider.notifier).state = index;

                    if (index == 0) {
                      Appnav.push(context, const AboutusView());
                    } else if (index == 1) {
                      Appnav.push(context, const ReportsView());
                    } else if (index == 2) {
                      Appnav.push(context, const TestlistView());
                    } else if (index == 3) {
                      Appnav.push(context, HomeSamplingView());
                    } else if (index == 4) {
                      Appnav.push(context, const BranchLocationView());
                    } else if (index == 5) {
                      Appnav.push(context, const AppointmentMenuView());
                    }
                  },
                  child: myHomeCard(
                    title: cardsData[index].title,
                    iconPath: cardsData[index].iconPath,
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.home,
            //       size: 22,
            //       color: selectedIndex != null
            //           ? Colors.grey
            //           : ConstColors.lightBlueColor,
            //     ),
            //     Row(
            //       children: List.generate(
            //         cardsData.length,
            //         (index) => Container(
            //           height: 10,
            //           width: 10,
            //           margin: const EdgeInsets.all(4),
            //           decoration: BoxDecoration(
            //             color: selectedIndex == index
            //                 ? ConstColors.lightBlueColor
            //                 : Colors.grey,
            //             borderRadius: BorderRadius.circular(100),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget myHomeCard({required String iconPath, required String title}) {
    return Card(
      color: Colors.white,
      elevation: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            iconPath,
            height: 60,
            width: 60,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: MyTextStyles.mediumText.copyWith(
              color: ConstColors.lightBlueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class CardData {
  String iconPath;
  String title;

  CardData({required this.title, required this.iconPath});
}

List<CardData> cardsData = [
  CardData(title: "About Us", iconPath: ImagePath.aboutUs),
  CardData(title: "Online Reports", iconPath: ImagePath.reportsIcon),
  CardData(title: "All Tests", iconPath: ImagePath.test),
  CardData(title: "Book Home\nSampling", iconPath: ImagePath.bikeIcon),
  CardData(title: "Our Branches", iconPath: ImagePath.location),
  CardData(title: "Consult Doctor", iconPath: ImagePath.stethoScope),
];

final indexProvider = StateProvider<int?>((ref) {
  return null;
});
