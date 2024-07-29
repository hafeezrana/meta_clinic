import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_clinic/onboard_view.dart';
import 'package:meta_clinic/utils/assets_path_consts.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/utils/navigation.dart';
import 'package:meta_clinic/views/widget/loader_widget.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Appnav.pushReplacemend(context, OnboardView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.lightBlueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Image.asset(ImagePath.logo),
          const LoaderWidget()
        ],
      ),
    );
  }
}
