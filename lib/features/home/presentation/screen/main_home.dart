import 'package:dev_bank/core/const/colors.dart';
import 'package:dev_bank/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});
  final controller = Get.find<HomeController>();
  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.search,
    Icons.mail_outline,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) => controller.selectedtab.value = index,
        // children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.terminalBG, width: 2),
          ),
          color: Colors.white,
        ),
        height: 80.h,
        child: Obx(() {
          return Row(
            children: List.generate(icons.length, (index) {
              bool isActive = controller.selectedtab.value == index;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // controller.pagesetect(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.only(bottom: isActive ? 15.h : 0),
                    alignment: Alignment.center,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 1.0,
                        end: isActive ? 1.3 : 1.0,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      builder: (context, scale, child) {
                        return Transform.scale(scale: scale, child: child);
                      },
                      child: Icon(
                        icons[index],
                        size: 30.sp,
                        color: isActive ? AppColors.green : AppColors.neonCyan,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
    //   bottomNavigationBar: BottomNavigationBar(
    //     backgroundColor: AppColors.terminalBG,
    //     selectedItemColor: AppColors.neonGreen,
    //     unselectedItemColor: AppColors.neonCyan.withOpacity(0.5),
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    //       BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messages'),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.settings),
    //         label: 'Settings',
    //       ),
    //     ],
    //   ),
    // );
  }
}
