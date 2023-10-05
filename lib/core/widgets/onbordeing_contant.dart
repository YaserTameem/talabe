import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabe/core/style/app_colors.dart';
import 'package:talabe/core/widgets/custom_page_indecator.dart';

class CoustomOnbordeingScreen extends StatelessWidget {
  const CoustomOnbordeingScreen({
    required this.image,
    required this.title,
    required this.supTitle,
    super.key,
  });

  final String image;
  final String title;
  final String supTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 50.w),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28.sp,
                    color: AppColor.textColor),
              ),
              SizedBox(height: 32.h,),
              Text(
                supTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AppColor.Paragraf),
              )
            ],
          ),
        ),
      ],
    );
  }
}
