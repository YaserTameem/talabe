import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talabe/core/style/app_colors.dart';
import 'package:talabe/core/widgets/app_text_filed.dart';
import 'package:talabe/core/widgets/custom_bottom_button.dart';
import 'package:talabe/modules/auth_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;
  String? _errorEmailValue;
  String? _errorPassWordValue;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = signupAction;
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void signupAction() {
    Navigator.of(context).pushNamed(SignUpScreen.screenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(top: 62.h, start: 30.w, end: 30.w),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              'Add your details to login',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.Paragraf),
            ),
            AppTextFiled(
              hint: 'Your Email',
              controller: _emailTextEditingController,
              keyboard: TextInputType.emailAddress,
              constraints: _errorEmailValue != null ? 81 : 56,
              errorText: _errorEmailValue,
              paddingTop: 35,
            ),
            AppTextFiled(
              hint: 'Password',
              controller: _passwordTextEditingController,
              constraints: _errorEmailValue != null ? 81 : 56,
              keyboard: TextInputType.visiblePassword,
              errorText: _errorPassWordValue,
              paddingTop: 28,
              obscure: _obscure,
              suffix: _obscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onPress: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
            ),
            CustomBottomButton(
                marginTop: 28,
                title: 'Login',
                ontap: () {
                  performLogin();
                },
                color: 0xFFFC6011,
                textColor: 0xFFFFFFFF),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Forgot your password?',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColor.Paragraf),
            ),
            SizedBox(
              height: 49.h,
            ),
            Text(
              'or Login With',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColor.Paragraf),
            ),
            SizedBox(
              height: 26.h,
            ),
            CustomBottomButton(
                marginTop: 28,
                buttonIcon: Icons.facebook_outlined,
                title: 'Login with Facebook',
                ontap: () {},
                color: 0xFF367FC0,
                textColor: 0xFFFFFFFF),
            CustomBottomButton(
                marginTop: 28,
                buttonIcon: Icons.person_add_alt_1_outlined,
                title: 'Login with Google',
                ontap: () {},
                color: 0xFFDD4B39,
                textColor: 0xFFFFFFFF),
            SizedBox(
              height: 60.h,
            ),
            RichText(
              text: TextSpan(
                  text: 'Dont Have Account? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColor.Paragraf,
                  ),
                  children: [
                    TextSpan(
                        recognizer: _tapGestureRecognizer,
                        text: ' Sign Up',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.kMainColor))
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      setStateErrorValue();
      return true;
    }
    setStateErrorValue();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        margin:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFFFF4343),
        content: const Text('Enter Required Data')));
    return false;
  }

  void setStateErrorValue() {
    setState(() {
      _errorEmailValue =
          _emailTextEditingController.text.isEmpty ? 'Enter Email' : null;
      _errorPassWordValue =
          _passwordTextEditingController.text.isEmpty ? 'Enter Password' : null;
    });
  }

  void login() {
    Get.toNamed(SignUpScreen.screenRoute);
  }
}
