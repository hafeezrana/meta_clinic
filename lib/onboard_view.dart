import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

class OnboardView extends ConsumerWidget {
  OnboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: PageView.builder(
        itemCount: boardingList.length,
        onPageChanged: (val) {
          ref.watch(currentIndexProvider.notifier).state = val;
        },
        itemBuilder: (context, index) {
          return bodyArea(
            boardingList[index].imagePath,
            boardingList[index].title,
            boardingList[index].description,
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 300,
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: idx == currentIndex
                              ? ConstColors.greyBlueColor
                              : ConstColors.lightgreyBlueColor),
                    ),
                  );
                },
              ),
            ),
            const CircleAvatar(
              radius: 27,
              backgroundColor: ConstColors.greyBlueColor,
              child: Icon(
                Icons.arrow_forward,
                size: 30,
                color: ConstColors.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyArea(
    String imagePath,
    String title,
    String description,
  ) {
    return SizedBox(
      height: Get.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
              width: Get.width * 0.8,
              height: Get.height * 0.5,
            ),
            Column(
              children: [
                SizedBox(
                  width: Get.width * 0.6,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: MyTextStyles.extraLargeText,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: MyTextStyles.smallText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardData {
  String title;
  String description;
  String imagePath;
  OnBoardData(
      {required this.title,
      required this.description,
      required this.imagePath});
}

final boardingList = [
  OnBoardData(
      title: 'Welcome to Meta Medical Centre',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard industry standard has been standard  ",
      imagePath: ImagePath.onboard1),
  OnBoardData(
      title: 'Meta Diagonstic Centre',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard industry standard has been standard  ",
      imagePath: ImagePath.onboard2),
  OnBoardData(
    title: 'Easy \nAppointments',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard industry standard has been standard  ",
    imagePath: ImagePath.onboard3,
  ),
];

final currentIndexProvider = StateProvider<int>((ref) => 0);
