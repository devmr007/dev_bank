import 'package:dev_bank/core/const/colors.dart';
import 'package:dev_bank/core/global/customBlinkText.dart';
import 'package:dev_bank/core/global/customButton.dart';
import 'package:dev_bank/core/global/customTyping.dart';
import 'package:dev_bank/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Verify extends StatelessWidget {
  Verify({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: TypingText(
            words: [
              "Enter OTP",
              "Verify Code",
              "Submit OTP",
              "Confirm Code",
              "Send OTP",
              "Resend Code",
              "Authenticate",
              "Complete Verification",
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
                  text: '> Checking verification token',
                  textColor: AppColors.white,
                  fontSize: 25,
                ),
                Gap(10),
                // ProgrammingTextField(
                //   label: 'Email',
                //   controller: controller.otp,
                // ),
                RoundedPinInput(),
                Gap(30),
                ProgrammingButton(text: "Send Values", onPressed: () {}),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedPinInput extends StatelessWidget {
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;

  const RoundedPinInput({super.key, this.onCompleted, this.validator});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    // final defaultPinTheme = PinTheme(
    //   width: 55.w,
    //   height: 60.h,
    //   textStyle: TextStyle(
    //     fontSize: 22.sp,
    //     fontWeight: FontWeight.w600,
    //     color: Colors.greenAccent,
    //     fontFamily: 'SourceCodePro', // optional code font
    //   ),
    //   decoration: BoxDecoration(
    //     color: AppColors.terminalBG.withOpacity(0.4),
    //     borderRadius: BorderRadius.circular(8.r),
    //     border: Border.all(
    //       color: Colors.greenAccent.withOpacity(0.3),
    //       width: 1.5,
    //     ),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.greenAccent.withOpacity(0.15),
    //         blurRadius: 5,
    //         spreadRadius: 1,
    //       ),
    //     ],
    //   ),
    // );
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 60.h,
      textStyle: TextStyle(
        fontSize: 22.sp,
        color: Colors.greenAccent,
        fontFamily: 'SourceCodePro', // optional
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(
            color: Colors.greenAccent.withOpacity(0.5),
            width: 2,
          ),
        ),
      ),
    );

    return Pinput(
      controller: authController.otp,
      validator: validator,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      cursor: Container(
        width: 14.w,
        height: 2.h,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.6),
              blurRadius: 8,
            ),
          ],
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border(
            bottom: BorderSide(color: Colors.greenAccent, width: 2),
          ),

          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.greenAccent.withOpacity(0.5),
          //     blurRadius: 10,
          //     spreadRadius: 1,
          //   ),
          // ],
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: Colors.greenAccent.withOpacity(0.1),
        ),
      ),
      showCursor: true,
      onCompleted: onCompleted,
    );
  }
}
