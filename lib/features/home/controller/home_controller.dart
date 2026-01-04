import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  var selectedtab = 0.obs;

  RxList<String> videoUrls = <String>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt currentSeconds = 0.obs;

  YoutubePlayerController? ytController;
  Timer? timer;

  void pageSelect(int index) {
    selectedtab.value = index;
    pageController.jumpToPage(index);
  }

  void initPlayer(String url) {
    ytController?.dispose();

    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(autoPlay: true, loop: false),
    )..addListener(playerListener);

    startTimer();
  }

  void playerListener() {
    if (ytController == null) return;

    final position = ytController!.value.position.inSeconds;
    final duration = ytController!.metadata.duration.inSeconds;

    currentSeconds.value = position;

    if (duration > 0 && position >= duration) {
      playNext();
    }
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // handled by listener
    });
  }

  void playNext() {
    if (videoUrls.isEmpty) return;

    currentIndex.value = (currentIndex.value + 1) % videoUrls.length;

    ytController!.load(
      YoutubePlayer.convertUrlToId(videoUrls[currentIndex.value])!,
    );
  }

  void addVideo(String url) {
    if (YoutubePlayer.convertUrlToId(url) == null) return;

    videoUrls.add(url);

    if (videoUrls.length == 1) {
      initPlayer(url);
    }
  }

  void removeVideo(int index) {
    videoUrls.removeAt(index);

    if (videoUrls.isEmpty) {
      ytController?.pause();
      currentIndex.value = 0;
      currentSeconds.value = 0;
      return;
    }

    if (currentIndex.value >= videoUrls.length) {
      currentIndex.value = 0;
      playNext();
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    ytController?.dispose();
    pageController.dispose();
    super.onClose();
  }
}
