import 'package:dev_bank/app_routes.dart';
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

class SignIn extends StatelessWidget {
  SignIn({super.key});
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
              'Sign In',
              'Login In',
              'Access Account',
              'Enter',
              'Member Login',
              'Authenticate',
              'Connect',
              'Resume Session',
              'Account Entry',
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
              // right: BorderSide(
              //   color: Colors.cyanAccent.withOpacity(0.4),
              //   width: 1.5,
              // ),
              // left: BorderSide(
              //   color: Colors.cyanAccent.withOpacity(0.4),
              //   width: 1.5,
              // ),
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
                  text: '> Welcome back, developers!',
                  textColor: AppColors.white,
                  fontSize: 25,
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
                Row(
                  children: [
                    SizedBox(),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPass);
                      },
                      child: BlinkingText(
                        text: 'forgot password?',
                        textColor: AppColors.buttonText,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                ProgrammingButton(
                  text: "Sign In",
                  onPressed: () {
                    controller.signIn(
                      email: controller.email.text,
                      password: controller.password.text,
                    );
                  },
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: AppColors.shadowGreen,
                      ),
                    ),
                    Gap(10),
                    CTinter(text: 'or', textColor: AppColors.white),
                    Gap(10),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: AppColors.shadowGreen,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GOOGLE LOGIN BUTTON
                    InkWell(
                      onTap: () {
                        // controller.signInWithGoogle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.terminalBG.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.cyanAccent.withOpacity(0.4),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/logo/googlelogo.png',
                              width: 20,
                              height: 20,
                            ),

                            Gap(10),
                            Text(
                              "Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Gap(20),

                    // APPLE LOGIN BUTTON
                    InkWell(
                      onTap: () {
                        // controller.signInWithApple();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.terminalBG.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.cyanAccent.withOpacity(0.4),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.apple, color: Colors.white, size: 22),
                            Gap(10),
                            Text(
                              "Apple",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CTinter(
                      text: 'Don\'t have an account? ',
                      textColor: AppColors.white,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signup);
                      },
                      child: BlinkingText(
                        text: 'SignUp',
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
