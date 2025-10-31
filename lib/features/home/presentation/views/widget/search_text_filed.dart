import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_style.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),

      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            Assets.imagesSearch,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: SvgPicture.asset(
            Assets.imagesFilter,
            fit: BoxFit.scaleDown,
          ),
          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0x0A000000)),
    );
  }
}
