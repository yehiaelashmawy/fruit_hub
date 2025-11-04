import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';

import 'notification_widget.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: NotifactionWidget(),
      ),
    ],
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios),
    ),
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
  );
}
