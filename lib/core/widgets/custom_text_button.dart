import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.title,
    required this.onPress,
    super.key,
  });
  final String title;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(title, style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black )),
    );
  }
}