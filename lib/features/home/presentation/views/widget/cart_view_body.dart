import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_items_list.dart';
import '../../../../../constans.dart';
import '../../../../../core/widgets/build_app_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
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
                ],
              ),
            ),
            SliverToBoxAdapter(child: Divider(color: const Color(0xFFF1F1F5))),
            CartItemsList(),
            SliverToBoxAdapter(child: Divider(color: const Color(0xFFF1F1F5))),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.08,
          left: 20,
          right: 20,
          child: CustomButton(onPressed: () {}, text: 'الدفع  120جنيه'),
        ),
      ],
    );
  }
}
