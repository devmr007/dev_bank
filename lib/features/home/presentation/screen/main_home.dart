import 'package:dev_bank/core/const/colors.dart';
import 'package:dev_bank/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) => controller.selectedtab.value = index,
        children: [
          HomePage(),
          Center(child: Text('Search')),
          Center(child: Text('Message')),
          Center(child: Text('Setting')),
        ],
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
  }
}

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(text: "YouTube Playlist Loop"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => controller.videoUrls.isEmpty
                ? const SizedBox()
                : YoutubePlayer(
                    controller: controller.ytController!,
                    showVideoProgressIndicator: true,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: linkController,
                    decoration: const InputDecoration(hintText: "YouTube link"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.addVideo(linkController.text);
                    linkController.clear();
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              "Timer: ${controller.currentSeconds.value}s",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.videoUrls.length,
                itemBuilder: (c, i) => ListTile(
                  title: Text(controller.videoUrls[i]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.removeVideo(i),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: textColor ?? Colors.green,
      ),
    );
  }
}
