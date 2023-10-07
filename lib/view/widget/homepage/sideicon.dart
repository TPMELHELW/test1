import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test1/controller/videoplayercontroller.dart';
import 'package:test1/view/widget/iconbuttonwidget.dart';

class SideIcon extends StatelessWidget {
  final PlayerController controller;
  const SideIcon({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButtonWidget(
                icon: controller.isLike
                    ? EvaIcons.arrowCircleUp
                    : EvaIcons.arrowCircleUpOutline,
                onpress: () {
                  controller.isDislike = false;
                  controller.isLike ? controller.likes-- : controller.likes++;
                  controller.isLike = !controller.isLike;
                  controller.update();
                },
                color: controller.isLike ? Colors.red : Colors.white,
              ),
              Text(
                '${controller.likes}',
                style: const TextStyle(color: Colors.white),
              ),
              IconButtonWidget(
                icon: controller.isDislike == false
                    ? EvaIcons.arrowCircleDownOutline
                    : EvaIcons.arrowCircleDown,
                onpress: () {
                  controller.isLike ? controller.likes-- : null;
                  controller.isDislike = !controller.isDislike;
                  controller.isLike = false;
                  controller.update();
                },
                color: controller.isDislike == false
                    ? Colors.white
                    : Colors.blueAccent,
              ),
              IconButton(
                onPressed: () {
                  controller.panelController.isPanelShown
                      ? controller.panelController.hide()
                      : controller.panelController.show();
                  controller.isExist = !controller.isExist;
                  controller.update();
                },
                icon: const FaIcon(FontAwesomeIcons.message),
                color: Colors.white,
              ),
              const Text(
                "100",
                style: TextStyle(color: Colors.white),
              ),
              IconButtonWidget(
                icon: Icons.share,
                onpress: () {},
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}
