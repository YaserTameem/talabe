import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talabe/modules/splash_screen/onboarding_screen.dart';
import 'package:talabe/modules/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
              fontFamily: 'Segoe', scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.screenRoute,
          getPages: [
            GetPage(
                name: SplashScreen.screenRoute,
                page: () => const SplashScreen()),
            GetPage(
                name: OneBoardingScreen.screenRoute,
                page: () => const OneBoardingScreen()),
          ],
        );
      },
    );
  }
}
