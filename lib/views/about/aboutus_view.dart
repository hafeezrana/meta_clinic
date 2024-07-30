import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

import '../widget/appbar.dart';

class AboutusView extends ConsumerWidget {
  const AboutusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(title: 'About Us'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.add_business_outlined,
                    size: 105,
                    color: ConstColors.lightBlueColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Mr. Elon Musk',
                        style: MyTextStyles.extraLargeText,
                      ),
                      Text(
                        'Founder of Space X',
                        style: MyTextStyles.largeText,
                      ),
                      Text(
                        'Since 2002',
                        style: MyTextStyles.largeText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '19 Years of Excellence',
                style: MyTextStyles.extraLargeText,
              ),
            ),
            Text(
              '''
            Body text for your whole article or post. We’ll put in some lorem ipsum to show how a filled-out page might look:
        Excepteur efficient emerging, minim veniam anim aute carefully curated Ginza conversation exquisite perfect nostrud nisi intricate Content. Qui  international first-class nulla ut. Punctual adipisicing, essential lovely queen tempor eiusmod irure. Exclusive izakaya charming Scandinavian impeccable aute quality of life soft power pariatur Melbourne occaecat discerning. Qui wardrobe aliquip, et Porter destination Toto remarkable officia Helsinki excepteur Basset hound. Zürich sleepy perfect consectetur.
        Exclusive izakaya charming Scandinavian impeccable aute quality of life soft power pariatur Melbourne occaecat discerning. Qui wardrobe aliquip, et Porter destination Toto remarkable officia Helsinki excepteur Basset hound. Zürich sleepy perfect consectetur.
            ''',
              style: MyTextStyles.mediumText,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
