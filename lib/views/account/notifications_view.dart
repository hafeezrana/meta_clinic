import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/appbar.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../widget/icon_button.dart';

class NotificationsView extends ConsumerWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyBackButton(),
              ),
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return notificationCard();
                }),
          ],
        ),
      ),
    );
  }

  Widget notificationCard() {
    return Card(
      color: ConstColors.whiteColor,
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.notifications,
              size: 35,
              color: ConstColors.lightBlueColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notification Title',
                        style: MyTextStyles.largeText
                            .copyWith(color: ConstColors.lightBlueColor),
                      ),
                      Text(
                        '10:24',
                        style: MyTextStyles.smallText
                            .copyWith(color: ConstColors.lightBlueColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.8,
                  child: const Text(
                    'Hi Mr Flutter, Are you ready to join free medical consultancy seminar Expo. Meet with specialist and get examined.',
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    style: MyTextStyles.smallText,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
