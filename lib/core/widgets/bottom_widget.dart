import 'package:chatso/feature/user/viewmodel/bottom_nav_provider.dart';
import 'package:chatso/core/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildNavItems(
  BuildContext context,
  IconData icon,
  int index, {
  String? label,
}) {
  final provider = Provider.of<Bottomnavprovider>(context);
  final selectedItem = provider.index == index;

  return GestureDetector(
    onTap: () => provider.ChangeIndex(index),
    behavior: HitTestBehavior.deferToChild,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: selectedItem ? Colors.black : Colors.grey,
        ),
        if (label != null)
          text(
            text: label,
            colors: selectedItem ? Colors.black : Colors.grey,
            fontweights: FontWeight.bold,
          ),
      ],
    ),
  );
}
