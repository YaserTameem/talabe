import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talabe/modules/auth_screens/getting_started_screen.dart';
import 'package:talabe/modules/auth_screens/login_screen.dart';
import 'package:talabe/modules/auth_screens/signup_screen.dart';
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
            GetPage(
                name: GettingStartScreen.screenRoute,
                page: () => const GettingStartScreen()),
            GetPage(
                name: LoginScreen.screenRoute, page: () => const LoginScreen()),
            GetPage(
                name: SignUpScreen.screenRoute, page: () => const SignUpScreen()),
          ],
        );
      },
    );
  }
}
