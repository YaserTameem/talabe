import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabe/core/style/app_colors.dart';

class CustomPageIndecator extends StatelessWidget {
  const CustomPageIndecator({
    this.marginEnd = 0,
    required this.isCurrentIndex,
    super.key,
  });

  final double marginEnd;
  final bool isCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd.w),
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isCurrentIndex ? AppColor.kMainColor : const Color(0xFFD6D6D6),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }
}
