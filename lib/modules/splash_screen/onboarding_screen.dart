import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:talabe/core/widgets/custom_bottom_button.dart';
import 'package:talabe/core/widgets/custom_page_indecator.dart';
import 'package:talabe/core/widgets/custom_text_button.dart';
import 'package:talabe/core/widgets/onbordeing_contant.dart';
import 'package:talabe/modules/auth_screens/getting_started_screen.dart';

class OneBoardingScreen extends StatefulWidget {
  static const String screenRoute = '/OneBoardingScreen';

  const OneBoardingScreen({super.key});

  @override
  State<OneBoardingScreen> createState() => _OneBoardingScreenState();
}

class _OneBoardingScreenState extends State<OneBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: CustomTextButton(
                  title: 'START',
                  onPress: () {
                    Get.offNamed(GettingStartScreen.screenRoute);
                  },
                ),
                child: CustomTextButton(
                  title: 'SKIP',
                  onPress: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                controller: _pageController,
                // scrollDirection: Axis.vertical,
                children: const [
                  CoustomOnbordeingScreen(
                      image: 'images/onbording1.png',
                      title: 'Find Food You Love',
                      supTitle:
                          '    Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep'),
                  CoustomOnbordeingScreen(
                      image: 'images/onbording2.png',
                      title: 'Fast Delivery',
                      supTitle:
                          'Fast food delivery to your home, office\n              wherever you are'),
                  CoustomOnbordeingScreen(
                    image: 'images/onbording3.png',
                    title: 'Live Tracking',
                    supTitle:
                        'Real time tracking of your food on the app \n           once you placed the order',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPageIndecator(
                  marginEnd: 5,
                  isCurrentIndex: _currentPage == 0,
                ),
                CustomPageIndecator(
                    marginEnd: 5, isCurrentIndex: _currentPage == 1),
                CustomPageIndecator(isCurrentIndex: _currentPage == 2),
              ],
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: AlignmentDirectional.center,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: CustomBottomButton(
                  textColor: 0xFFFFFFFF,
                  color: 0xFFFC6011,
                  title: 'Get Start',
                  ontap: () {
                    Get.offNamed(GettingStartScreen.screenRoute);
                  },
                ),
                child: CustomBottomButton(
                  textColor:0xFFFFFFFF ,
                  color: 0xFFFC6011,
                  title: 'Next',
                  ontap: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutBack);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
