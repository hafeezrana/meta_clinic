import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/widget/text_styles.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.lightBlueColor,
        leading: const Icon(
          Icons.home,
          color: ConstColors.whiteColor,
        ),
        title: Text(
          'Home',
          style: MyTextStyles.extraLargeText
              .copyWith(color: ConstColors.whiteColor),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle_rounded,
                size: 25, color: ConstColors.whiteColor),
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Home Page')),
        ],
      ),
    );
  }
}
