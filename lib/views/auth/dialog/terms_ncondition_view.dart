import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

class TermsNconditionView extends ConsumerWidget {
  const TermsNconditionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Terms and Condition',
          style: MyTextStyles.extraLargeText,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n"
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets  versions of Lorem Ipsum."
              "\n\nLorem Ipsum is simply dummy text of the"
              "printing and typesetting industry.",
              textAlign: TextAlign.justify,
              style: MyTextStyles.smallText
                  .copyWith(color: ConstColors.lightBlueColor),
            )
          ],
        ),
      ),
    );
  }
}
