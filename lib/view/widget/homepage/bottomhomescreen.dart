import 'package:flutter/material.dart';
import 'package:test1/controller/videoplayercontroller.dart';
import 'package:test1/view/widget/homepage/slider.dart';
import 'package:test1/view/widget/iconbuttonwidget.dart';

class BottomHomeScreen extends StatelessWidget {
  final List postUserData;
  final PlayerController controller;
  const BottomHomeScreen(
      {super.key, required this.postUserData, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                postUserData[0].userName,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            postUserData[0].postBody,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButtonWidget(
                icon: controller.isPlay ? Icons.pause : Icons.play_arrow,
                onpress: () {
                  controller.isPlay
                      ? controller.controller.pause()
                      : controller.controller.play();
                  controller.isPlay = !controller.isPlay;
                }, color: Colors.white,
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.controller.position,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Row(
                        children: [
                          SliderWidget(
                              snapshot: snapshot, controller: controller),
                          Text(
                            '${snapshot.data!.inMinutes}:${(snapshot.data!.inSeconds % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              IconButtonWidget(
                icon:
                    controller.isVolume ? Icons.volume_down : Icons.volume_mute,
                onpress: () {
                  controller.isVolume
                      ? controller.controller.setVolume(0)
                      : controller.controller.setVolume(100);
                  controller.isVolume = !controller.isVolume;
                }, color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
