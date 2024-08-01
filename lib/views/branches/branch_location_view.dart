import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../widget/appbar.dart';
import '../widget/search_field.dart';
import '../widget/text_styles.dart';
import 'branch_view.dart';

class BranchLocationView extends ConsumerStatefulWidget {
  const BranchLocationView({super.key});

  @override
  ConsumerState<BranchLocationView> createState() => _BranchLocationViewState();
}

class _BranchLocationViewState extends ConsumerState<BranchLocationView> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(indexProvider);

    return Scaffold(
      backgroundColor: ConstColors.whiteColor,
      appBar: customAppBar(title: 'Location'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            const SearchField(),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.4,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(indexProvider.notifier).state = 0;
                    },
                    child: Card(
                      elevation: 6,
                      color: selectedIndex == 0
                          ? ConstColors.lightBlueColor
                          : ConstColors.whiteColor,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Location',
                            style: MyTextStyles.mediumText.copyWith(
                              color: selectedIndex == 0
                                  ? ConstColors.whiteColor
                                  : ConstColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(indexProvider.notifier).state = 1;
                    },
                    child: Card(
                      elevation: 6,
                      color: selectedIndex == 1
                          ? ConstColors.lightBlueColor
                          : ConstColors.whiteColor,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Branches',
                          style: MyTextStyles.mediumText.copyWith(
                            color: selectedIndex == 1
                                ? ConstColors.whiteColor
                                : ConstColors.black,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            selectedIndex == 0
                ? const Center(child: Text('Google Map'))
                : const BranchView()
          ],
        ),
      ),
    );
  }
}

final indexProvider = StateProvider<int>((ref) {
  return 0;
});
