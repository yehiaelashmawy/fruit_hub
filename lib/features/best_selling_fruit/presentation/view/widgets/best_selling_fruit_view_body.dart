import 'package:flutter/material.dart';
import 'package:fruit_hub/constans.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/best_seling_grad_view.dart';

class BestSellingFruitViewBody extends StatelessWidget {
  const BestSellingFruitViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 24),
              child: Text(
                'الأكثر مبيعًا',
                textAlign: TextAlign.right,
                style: TextStyles.bold16.copyWith(
                  color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
                ),
              ),
            ),
          ),
          BestSelingGridView(products: []),
        ],
      ),
    );
  }
}
