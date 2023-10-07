import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/controller/videoplayercontroller.dart';
import 'package:test1/core/data/postuserdata.dart';
import 'package:test1/view/widget/homepage/appbarhomescreen.dart';
import 'package:test1/view/widget/comments/commentview.dart';
import 'package:test1/view/widget/homepage/bottomhomescreen.dart';

class HomeScreen extends StatelessWidget {
  final RxBool isBottomSheetOpen = false.obs;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayerController());
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.black,
      body: GetBuilder<PlayerController>(
          init: PlayerController(),
          builder: (controller0) {
            if (controller0.controller != null &&
                controller0.controller.value.isInitialized) {
              return Stack(
                children: [
                  BottomHomeScreen(
                    postUserData: postUserData,
                    controller: controller0,
                  ),
                  CommentView(
                    controller0: controller0,
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
