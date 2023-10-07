import 'package:flutter/material.dart';

PreferredSizeWidget appBar = AppBar(
  actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
  leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
  centerTitle: true,
  title: const Text('userName'),
  backgroundColor: Colors.transparent,
);
