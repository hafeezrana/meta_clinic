import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

class MyDialogues {
  static simpleCupertinoDialogue(
      {required BuildContext context,
      required String title,
      String? cancel,
      String? yes,
      TextEditingController? controller,
      void Function()? onYes}) {
    return showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: MyTextStyles.largeText.copyWith(color: Colors.black),
          ),
          content: controller != null
              ? Material(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      controller: controller,
                      style:
                          MyTextStyles.smallText.copyWith(color: Colors.black),
                      maxLines: 20,
                      minLines: 6,
                      decoration: InputDecoration(
                        hintText: 'Why do you want to BookMark it?.Explain',
                        hintStyle: MyTextStyles.smallText
                            .copyWith(color: ConstColors.grey),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          actions: [
            CupertinoDialogAction(
              child: Text(
                cancel ?? 'No',
                style:
                    MyTextStyles.mediumText.copyWith(color: ConstColors.grey),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              onPressed: onYes,
              child: Text(
                yes ?? 'Yes',
                style: MyTextStyles.mediumText.copyWith(color: ConstColors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
