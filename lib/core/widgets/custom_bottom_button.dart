import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabe/core/style/app_colors.dart';


class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    required this.title,
    required this.ontap,
    required this.color,
    required this.textColor,
     this.marginTop=0,
     this.buttonIcon,
    super.key,
  });
  final String title;
  final void Function() ontap;
  final int color;
  final int textColor;
  final double marginTop;
  final IconData? buttonIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsetsDirectional.only(top: marginTop.h),
          padding: EdgeInsetsDirectional.only(end:20.w ),
          width: 307.w,
          height: 56.h,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(0,3)
                )
              ],
              borderRadius: BorderRadius.circular(99.r),
            color: Color(color)
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(buttonIcon,color: Colors.white,),
              SizedBox(width: 15.w,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle( fontSize: 16.sp, fontWeight: FontWeight.w600, color: Color(textColor)),
              ),
            ],
          )),
    );
  }
}
