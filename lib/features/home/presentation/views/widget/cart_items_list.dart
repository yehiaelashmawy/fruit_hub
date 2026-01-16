import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) =>
          const Divider(color: Color(0xFFF1F1F5), height: 18),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const CartItem();
      },
    );
  }
}
