import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/account/notifications_view.dart';
import 'package:meta_clinic/views/auth/login_view.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import 'favorite_doctors_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: "My Account"),
      body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                // Container(
                //   height: 70.h,
                //   color: ConstColors.lightBlueColor,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundColor: ConstColors.grey,
                              radius: 45,
                              child: Icon(
                                Icons.person,
                                color: ConstColors.whiteColor,
                                size: 50,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              'Mr. Flutter Dev',
                              style: MyTextStyles.largeText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Personal',
                          style: MyTextStyles.largeText,
                        ),
                      ),
                      iconsTitle(Icons.wallet_outlined, 'My Wallet', () {}),
                      iconsTitle(Icons.notifications, 'Notification', () {
                        Appnav.push(context, const NotificationsView());
                      }),
                      iconsTitle(Icons.call, 'Contact Us', () {}),
                      iconsTitle(Icons.person_2, 'My Doctor', () {
                        Appnav.push(context, const FavoriteDoctorsView());
                      }),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'General',
                          style: MyTextStyles.largeText,
                        ),
                      ),
                      iconsTitle(Icons.lock, 'Change Password', () {}),
                      iconsTitle(Icons.logout, 'Logout', () {
                        Appnav.pushAndRemoveUntil(context, LoginView());
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   top: 33.h,
          //   left: Get.width * 0.32,
          //   child: const Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         CircleAvatar(
          //           backgroundColor: ConstColors.grey,
          //           radius: 45,
          //           child: Icon(
          //             Icons.person,
          //             color: ConstColors.whiteColor,
          //             size: 50,
          //           ),
          //         ),
          //         Text(
          //           'Mr. Flutter asdf',
          //           style: MyTextStyles.largeText,
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget iconsTitle(IconData icon, String title, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Icon(
              icon,
              size: 27,
              color: ConstColors.lightBlueColor,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: MyTextStyles.mediumText,
            )
          ],
        ),
      ),
    );
  }
}
