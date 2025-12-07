import 'package:dev_bank/core/const/colors.dart';
import 'package:dev_bank/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.terminalBG, // Terminal background
      body: Center(
        child: AnimatedBuilder(
          animation: controller.transitionController,
          builder: (context, child) {
            return Transform.scale(
              scale: controller.scaleAnimation.value,
              child: Opacity(
                opacity: controller.opacityAnimation.value,
                child: child,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// D bounce
                  AnimatedBuilder(
                    animation: controller.bounceAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: controller.bounceAnimation.value,
                        child: child,
                      );
                    },
                    child: const Text(
                      "D",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellow, // Error red
                      ),
                    ),
                  ),

                  /// Remaining "ev" + cursor
                  Obx(
                    () => Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: Text(
                            controller.leftText.value.substring(1),
                            key: ValueKey(controller.leftText.value),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: AppColors.cyan, // Cyan syntax
                            ),
                          ),
                        ),

                        /// Cursor
                        AnimatedOpacity(
                          opacity: controller.showCursor.value ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Text(
                            "_",
                            style: TextStyle(
                              fontSize: 55,
                              color: AppColors.green, // Terminal cursor green
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// B bounce
                  AnimatedBuilder(
                    animation: controller.bounceAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: controller.bounceAnimation.value,
                        child: child,
                      );
                    },
                    child: const Text(
                      "B",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF3B30), // Error red
                      ),
                    ),
                  ),

                  /// Remaining "ank" + cursor
                  Obx(
                    () => Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: Text(
                            controller.rightText.value.substring(1),
                            key: ValueKey(controller.rightText.value),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00E5FF), // Cyan keyword
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: controller.showCursor.value ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const Text(
                            "_",
                            style: TextStyle(
                              fontSize: 55,
                              color: Color(0xFF00FF66), // Cursor green
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Code-comment style tagline
              const Text(
                "// Bank for Developers",
                style: TextStyle(
                  color: Color(0xFF6AFFA3), // Comment green
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
