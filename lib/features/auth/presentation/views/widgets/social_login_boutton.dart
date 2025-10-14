import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginBoutton extends StatelessWidget {
  const SocialLoginBoutton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
  });
  final VoidCallback onPressed;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xFF0C0D0D),
            ),
          ),
        ),
      ),
    );
  }
}
