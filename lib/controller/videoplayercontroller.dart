import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends GetxController {
  late VideoPlayerController controller;
  late bool isPlay;
  late bool isVolume;
  bool isLike = false;
  bool isDislike = false;
  bool isExist = false;
  int likes = 0;
  bool isLikesComment = false;
  bool isDislikeComment = false;
  late PanelController panelController ;
  @override
  void onInit() {
    controller = VideoPlayerController.asset('assets/videos/bee.mp4')
      ..addListener(() {
        update();
      })
      ..setLooping(true)
      ..initialize().then((value) {
        controller.play();
        isPlay = true;
        isVolume = true;
      });
      panelController = PanelController();
    // panelController.isPanelShown ? panelController.hide() : null;
    // update();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    // controller5.dispose();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     controller5.dispose();
  //   }
  // }
}
