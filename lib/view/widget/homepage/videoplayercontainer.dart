import 'package:flutter/material.dart';
import 'package:test1/controller/videoplayercontroller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContainer extends StatelessWidget {
  final PlayerController controller;
  const VideoPlayerContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:200),
      height: 190,
      child: VideoPlayer(controller.controller),
    );
  }
}
