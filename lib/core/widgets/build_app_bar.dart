import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';
import 'notification_widget.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
  bool showNotifactionButton = true,
}) {
  return AppBar(
    actionsPadding: const EdgeInsets.only(left: 16),
    actions: [
      Visibility(visible: showNotifactionButton, child: NotifactionWidget()),
    ],
    leading: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Visibility(
        visible: showBackButton,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, 'home');
            }
          },
        ),
      ),
    ),

    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
  );
}
