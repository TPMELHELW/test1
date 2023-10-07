import 'package:flutter/material.dart';

class TopCommentSection extends StatelessWidget {
  final String userName, postBody;
  const TopCommentSection(
      {super.key, required this.userName, required this.postBody});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const CircleAvatar(),
              const SizedBox(
                width: 10,
              ),
              Text(userName),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          postBody,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          decoration: const BoxDecoration(color: Colors.grey),
          child: const Row(
            children: [Icon(Icons.rocket), Text('Best Comment')],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
