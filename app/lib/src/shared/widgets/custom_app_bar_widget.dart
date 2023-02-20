import 'package:flutter/material.dart';

class CustomAppBarWidget extends AppBar {
  final String titleContent;
  final Widget? action;
  CustomAppBarWidget({
    super.key,
    required this.titleContent,
    this.action,
  }) : super(
          title: Text(titleContent),
          actions: [
            Visibility(
              visible: action != null,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: action,
              ),
            ),
          ],
        );
}
