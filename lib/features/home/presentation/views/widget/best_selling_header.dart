import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style: TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
        ),
      ],
    );
  }
}
