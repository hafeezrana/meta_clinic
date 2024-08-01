import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_clinic/onboard_view.dart';
import 'package:meta_clinic/utils/colors_const.dart';
import 'package:meta_clinic/views/home/home_view.dart';
import 'package:meta_clinic/views/splash.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
          title: 'Meta Medical Clinic',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Rubik',
            colorScheme: ColorScheme.fromSeed(
              seedColor: ConstColors.whiteColor,
            ),
            useMaterial3: true,
          ),
          home: const HomeView()
          // SplashView(),
          ),
    );
  }
}
