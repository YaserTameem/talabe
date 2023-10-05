import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talabe/core/style/app_colors.dart';
import 'package:talabe/core/widgets/custom_bottom_button.dart';
import 'package:talabe/modules/auth_screens/login_screen.dart';
import 'package:talabe/modules/auth_screens/signup_screen.dart';

class GettingStartScreen extends StatefulWidget {
  static const String screenRoute = '/GettingStartScreen';

  const GettingStartScreen({super.key});

  @override
  State<GettingStartScreen> createState() => _GettingStartScreenState();
}

class _GettingStartScreenState extends State<GettingStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 496.h,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PositionedDirectional(
                  top: 0.h,
                  child: const Image(
                      image: AssetImage('images/Default.png'),
                      fit: BoxFit.cover),
                ),
                PositionedDirectional(
                  top: 270.h,
                  child: const Image(image: AssetImage('images/Logo.png')),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            '    Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: AppColor.Paragraf),
          ),
          SizedBox(
            height: 57.h,
          ),
          CustomBottomButton(
              title: 'Login',
              ontap: () {
                Get.toNamed(LoginScreen.screenRoute);
              },
              color: 0xFFFC6011,
              textColor: 0xFFFFFFFF),
          CustomBottomButton(
            marginTop: 20,
            title: 'Create an Account',
            ontap: () {
              Get.toNamed(SignUpScreen.screenRoute);
            },
            color: 0xFFFFFFFF,
            textColor:0xFFFC6011 ,
          ),
        ],
      ),
    );
  }
}
