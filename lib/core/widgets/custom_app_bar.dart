import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';

AppBar buildCustomAppBar(context, {required String title}) {
  return AppBar(
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
