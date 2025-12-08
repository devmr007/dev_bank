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

class SetNewPass extends StatelessWidget {
  SetNewPass({super.key});
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
              "Set New Password",
              "Create New Password",
              "Update Credentials",
              "Reset Password",
              "Secure Your Account",
              "Enter New Password",
              "Rebuild Access",
              "Apply New Password",
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
          decoration: BoxDecoration(
            color: AppColors.terminalBG,
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
                  text: '> Initializing password reset sequence',
                  textColor: AppColors.white,
                  fontSize: 25,
                ),
                Gap(10),
                ProgrammingTextField(
                  isPassword: true,
                  label: 'Password',
                  controller: controller.password,
                ),
                Gap(10),
                ProgrammingTextField(
                  isPassword: true,
                  label: 'Re-type Password',
                  controller: controller.confirmpass,
                ),
                Gap(20),
                ProgrammingButton(
                  text: "Update Credential",
                  onPressed: () {
                    Get.offNamedUntil(AppRoutes.signin, (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
