import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/best_seling_grad_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/featured_list.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/search_text_filed.dart';

import '../../../../../constans.dart';
import '../../../../../core/cubits/products_cubit/products_cubit_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomHomeAppBar(),
                const SizedBox(height: kTopPadding),
                const SearchTextField(),
                const SizedBox(height: 12),
                FeaturedList(),
                const SizedBox(height: 12),
                BestSellingHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),

          BestSelingGridView(),
        ],
      ),
    );
  }
}
