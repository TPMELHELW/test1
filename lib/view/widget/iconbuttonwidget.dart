import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final void Function()? onpress;
  final Color color;
  const IconButtonWidget({super.key, required this.icon, this.onpress, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      iconSize: 30,
      onPressed: onpress,
      icon:  Icon(icon),
    );
  }
}
