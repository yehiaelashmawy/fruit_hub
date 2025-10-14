import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'أو',
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
