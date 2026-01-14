import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_style.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' $productsLength  نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        Spacer(),
        Container(
          height: 31,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Center(child: SvgPicture.asset(Assets.imagesFilter2)),
        ),
      ],
    );
  }
}
