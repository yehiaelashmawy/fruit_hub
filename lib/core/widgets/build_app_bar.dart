import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';
import 'notification_widget.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    actionsPadding: const EdgeInsets.only(left: 16),
    actions: [NotifactionWidget()],
    leading: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),

    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
  );
}
