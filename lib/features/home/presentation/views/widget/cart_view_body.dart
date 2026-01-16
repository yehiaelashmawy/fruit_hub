import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_item.dart';
import '../../../../../constans.dart';
import '../../../../../core/widgets/build_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(
                  context,
                  title: 'السلة',
                  showBackButton: true,
                  showNotifactionButton: false,
                ),
                const SizedBox(height: kTopPadding),
                const CartHeader(),
                const SizedBox(height: 12),
                CartItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
