import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabe/core/style/app_colors.dart';
import 'package:talabe/core/widgets/app_text_filed.dart';
import 'package:talabe/core/widgets/custom_bottom_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenRoute = '/SignUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _confirmPasswordTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _addressTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;
  bool _obscure = true;
  bool _obscureConfirm = true;
  String? _errorEmailValue;
  String? _errorNameValue;
  String? _errorPassWordValue;
  String? _errorConfirmPassWordValue;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
    _addressTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = signupAction;
  }

  void signupAction() {
    // Navigator.of(context).pushNamed(SignUpScreen.screenRoute);
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    _addressTextEditingController.dispose();
    // _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(top: 62.h, start: 30.w, end: 30.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 11.h,
            ),
            Text(
              'Add your details to sign up',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.Paragraf),
            ),
            AppTextFiled(
              hint: 'Name',
              controller: _nameTextEditingController,
              keyboard: TextInputType.text,
              constraints: _errorNameValue != null ? 81 : 56,
              errorText: _errorNameValue,
              paddingTop: 35,
            ),
            AppTextFiled(
              hint: 'Email',
              controller: _emailTextEditingController,
              keyboard: TextInputType.emailAddress,
              constraints: _errorEmailValue != null ? 81 : 56,
              errorText: _errorEmailValue,
              paddingTop: 28,
            ),
            AppTextFiled(
              hint: 'Mobile No',
              controller: _phoneTextEditingController,
              keyboard: TextInputType.phone,
              constraints: 56,
              paddingTop: 28,
            ),
            AppTextFiled(
              hint: 'Address',
              controller: _addressTextEditingController,
              keyboard: TextInputType.streetAddress,
              constraints: 56,
              paddingTop: 28,
            ),
            AppTextFiled(
              hint: 'Password',
              controller: _passwordTextEditingController,
              keyboard: TextInputType.visiblePassword,
              constraints: _errorPassWordValue != null ? 81 : 56,
              errorText: _errorPassWordValue,
              paddingTop: 28,
            ),
            AppTextFiled(
              hint: 'Confirm Password',
              controller: _confirmPasswordTextEditingController,
              keyboard: TextInputType.visiblePassword,
              constraints: _errorConfirmPassWordValue != null ? 81 : 56,
              errorText: _errorConfirmPassWordValue,
              paddingTop: 28,
            ),
            CustomBottomButton(
                marginTop: 28,
                title: 'Sign Up',
                ontap: () {
                  performSignUp();
                },
                color: 0xFFFC6011,
                textColor: 0xFFFFFFFF),
            SizedBox(
              height: 25.h,
            ),
            RichText(
              text: TextSpan(
                  text: 'Already have an Account? ',
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

  void performSignUp() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _confirmPasswordTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty) {
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
      _errorNameValue =
          _nameTextEditingController.text.isEmpty ? 'Enter Your Name' : null;
      _errorPassWordValue =
          _passwordTextEditingController.text.isEmpty ? 'Enter Password' : null;
      _errorConfirmPassWordValue =
          _confirmPasswordTextEditingController.text.isEmpty
              ? 'Retype Password'
              : null;
    });
  }

  void login() {
    // Get.toNamed(SignUpScreen.screenRoute);
  }
}
