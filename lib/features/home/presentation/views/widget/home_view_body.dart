import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/featured_list.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/search_text_filed.dart';
import '../../../../../constans.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomHomeAppBar(),
              const SizedBox(height: kTopPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: const SearchTextField(),
              ),
              const SizedBox(height: 12),
              FeaturedList(),
              const SizedBox(height: 12),
              BestSellingHeader(),
              const SizedBox(height: 12),

              FruitItem(),
            ],
          ),
        ),
      ],
    );
  }
}
