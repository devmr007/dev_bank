import 'package:dev_bank/core/const/colors.dart';
import 'package:dev_bank/core/global/customBlinkText.dart';
import 'package:dev_bank/core/global/customButton.dart';
import 'package:dev_bank/core/global/customTextField.dart';
import 'package:dev_bank/core/global/customTyping.dart';
import 'package:dev_bank/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SingUp extends StatelessWidget {
  SingUp({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.terminalBG,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: TypingText(
            words: [
              'Sign Up',
              'Register',
              'Create Account',
              'Join',
              'Get Started',
              'Enroll',
              'Open Account',
              'Become a Member',
              'Subscribe',
            ],
            fontSize: 16,
            textColor: Colors.white,
            fontWeight: FontWeight.w600,
            typingSpeed: Duration(milliseconds: 350),
            pauseDuration: Duration(milliseconds: 1000),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0xFF012A36),
          //       Color(0xFF013747),
          //       Color(0xFF01495A),
          //     ],
          //   ),
          //   borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(30),
          //     topRight: Radius.circular(30),
          //   ),
          // ),
          decoration: BoxDecoration(
            color: AppColors.terminalBG, // darker tone
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            border: Border(
              top: BorderSide(
                color: Colors.cyanAccent.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 0.5,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                BlinkingText(
                  text: '> Join the DevBank network',
                  textColor: AppColors.white,
                  fontSize: 25,
                ),
                Gap(10),
                ProgrammingTextField(
                  label: 'Full Name',
                  controller: controller.email,
                ),
                Gap(10),
                ProgrammingTextField(
                  label: 'Email',
                  controller: controller.email,
                ),
                Gap(10),
                ProgrammingTextField(
                  isPassword: true,
                  label: 'Password',
                  controller: controller.password,
                ),
                Gap(20),
                // Row(
                //   children: [
                //     SizedBox(),
                //     Spacer(),
                //     InkWell(
                //       onTap: () {
                //         Get.snackbar('forgot', 'forgot');
                //       },
                //       child: BlinkingText(
                //         text: 'forgot password?',
                //         textColor: AppColors.buttonText,
                //       ),
                //     ),
                //   ],
                // ),
                Gap(30),
                ProgrammingButton(
                  text: "Sign Up",
                  onPressed: () {
                    controller.signIn(
                      email: controller.email.text,
                      password: controller.password.text,
                    );
                  },
                ),
                Gap(20),
                // Center(
                //   child: Icon(
                //     Icons.fingerprint_outlined,
                //     size: MediaQuery.of(context).size.width * 0.2,
                //     color: AppColors.neonGreen,
                //   ),
                // ),
                // Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CTinter(
                      text: 'Have an account? ',
                      textColor: AppColors.white,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: BlinkingText(
                        text: 'SignIn',
                        textColor: AppColors.buttonText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CTinter extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  const CTinter({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
