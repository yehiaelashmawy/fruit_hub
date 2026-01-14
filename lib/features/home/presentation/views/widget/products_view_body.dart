import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/best_selling_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/custom_home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/products_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/search_text_filed.dart';
import '../../../../../constans.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
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
                ProductsHeader(
                  productsLength: context.read<ProductsCubit>().productsLength,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),

          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
