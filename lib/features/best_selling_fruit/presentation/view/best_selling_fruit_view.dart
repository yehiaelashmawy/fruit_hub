import 'package:flutter/material.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/view/widgets/best_selling_fruit_view_body.dart';

class BestSellingFruitView extends StatelessWidget {
  const BestSellingFruitView({super.key});
  static const routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BestSellingFruitViewBody());
  }
}
