import 'package:flutter/material.dart';
import 'package:test1/controller/videoplayercontroller.dart';

class SliderWidget extends StatelessWidget {
  final AsyncSnapshot<Duration?> snapshot;
  final PlayerController controller;
  const SliderWidget({super.key, required this.snapshot, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.white,
      value: snapshot.data!.inSeconds.toDouble(),
      min: 0.0,
      max: controller.controller.value.duration.inSeconds.toDouble(),
      onChanged: (value) {
        controller.controller.seekTo(Duration(seconds: value.toInt()));
      },
    );
  }
}
