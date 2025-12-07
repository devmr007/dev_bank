import 'package:dev_bank/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final String leftFull = "Dev";
  final String rightFull = "Bank";

  var leftText = "D".obs;
  var rightText = "B".obs;

  int leftIndex = 1;
  int rightIndex = 1;

  var showCursor = true.obs;

  late AnimationController bounceController;
  late Animation<double> bounceAnimation;

  late AnimationController transitionController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(const Duration(milliseconds: 400), (_) {
      showCursor.value = !showCursor.value;
    });

    // Bounce animation
    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    bounceAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.elasticOut)).animate(bounceController);

    bounceController.forward();

    // Fade-out only (no zoom)
    transitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: transitionController, curve: Curves.easeOut),
    );

    // No zoom effect
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: transitionController, curve: Curves.linear),
    );

    startTypingAnimation();
  }

  void startTypingAnimation() {
    const duration = Duration(milliseconds: 300);
    Timer.periodic(duration, (timer) {
      if (leftIndex < leftFull.length) {
        leftIndex++;
        leftText.value = leftFull.substring(0, leftIndex);
      } else if (rightIndex < rightFull.length) {
        rightIndex++;
        rightText.value = rightFull.substring(0, rightIndex);
      }

      if (leftIndex >= leftFull.length && rightIndex >= rightFull.length) {
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 400), () {
          transitionController.forward().whenComplete(() {
            Get.toNamed(AppRoutes.signin);
          });
        });
      }
    });
  }

  @override
  void onClose() {
    bounceController.dispose();
    transitionController.dispose();
    super.onClose();
  }
}
