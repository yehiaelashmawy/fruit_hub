import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/view/widgets/best_selling_fruit_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class BestSellingFruitView extends StatelessWidget {
  const BestSellingFruitView({super.key});
  static const routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الاكثر مبيعا'),
      body: BestSellingFruitViewBody(),
    );
  }
}
