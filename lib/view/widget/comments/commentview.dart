import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test1/controller/videoplayercontroller.dart';
import 'package:test1/core/data/commentdata.dart';
import 'package:test1/core/data/postuserdata.dart';
import 'package:test1/view/widget/comments/topsectioncomment.dart';
import 'package:test1/view/widget/homepage/sideicon.dart';
import 'package:test1/view/widget/homepage/videoplayercontainer.dart';
import 'package:test1/view/widget/iconbuttonwidget.dart';

class CommentView extends StatelessWidget {
  final PlayerController controller0;

  const CommentView({super.key, required this.controller0});
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
    snapPoint: 0.5,
      controller: controller0.panelController,
      minHeight: 10,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      maxHeight: MediaQuery.of(context).size.height,
      parallaxEnabled: true,
      parallaxOffset: 0.6,
      panelBuilder: (controller) => SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            TopCommentSection(
              userName: postUserData[0].userName,
              postBody: postUserData[0].postBody,
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemCount: commentData.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(commentData[i].userName),
                                Text(
                                  commentData[i].nickName,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              commentData[i].time,
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          commentData[i].commentBody,
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.bottomSheet(Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.ios_share),
                                            label: const Text('Share')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.bookmark_border),
                                            label: const Text('Save')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.notifications),
                                            label: const Text(
                                                'Stop reply notifications')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.copy_rounded),
                                            label: const Text('Copy Text')),
                                        TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit),
                                            label: const Text('Edit')),
                                        TextButton.icon(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                  title: 'Delete Comment',
                                                  content: const Text(
                                                      'Are you sure do you want to delete this Comment'),
                                                  onConfirm: () {
                                                    commentData
                                                        .remove(commentData[i]);

                                                    controller0.update();
                                                    Get.back();
                                                    Get.back();
                                                  },
                                                  onCancel: () {
                                                    Get.back();
                                                  });
                                            },
                                            icon: const Icon(Icons.delete),
                                            label: const Text('Delete')),
                                      ]),
                                ));
                              },
                              icon: const Icon(Icons.more_vert),
                            ),
                            TextButton.icon(
                              icon: const Icon(
                                Icons.reply,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                              label: const Text(
                                'Reply',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            IconButtonWidget(
                              icon: commentData[i].isLikes
                                  ? EvaIcons.arrowCircleUp
                                  : EvaIcons.arrowCircleUpOutline,
                              onpress: () {
                                commentData[i].isDisLikes = false;
                                commentData[i].isLikes
                                    ? commentData[i].likes--
                                    : commentData[i].likes++;
                                commentData[i].isLikes =
                                    !commentData[i].isLikes;
                                controller0.update();
                              },
                              color: commentData[i].isLikes
                                  ? Colors.red
                                  : Colors.black,
                            ),
                            Text('${commentData[i].likes}'),
                            IconButtonWidget(
                              icon: commentData[i].isDisLikes == false
                                  ? EvaIcons.arrowCircleDownOutline
                                  : EvaIcons.arrowCircleDown,
                              onpress: () {
                                commentData[i].isLikes
                                    ? commentData[i].likes--
                                    : null;
                                commentData[i].isDisLikes =
                                    !commentData[i].isDisLikes;
                                commentData[i].isLikes = false;
                                controller0.update();
                              },
                              color: commentData[i].isDisLikes == false
                                  ? Colors.black
                                  : Colors.blueAccent,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 8,
                          color: Colors.grey[400],
                        )
                      ]);
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          VideoPlayerContainer(
            controller: controller0,
          ),
          SideIcon(
            controller: controller0,
          ),
        ],
      ),
    );
  }
}
