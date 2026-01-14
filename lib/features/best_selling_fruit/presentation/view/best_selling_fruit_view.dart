import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../home/presentation/views/widget/product_grid_view_bloc_builder.dart';

class BestSellingFruitView extends StatelessWidget {
  const BestSellingFruitView({super.key});
  static const routeName = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt.get<ProductsRepo>())..getBestSellingProducts(),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الاكثر مبيعا'),
        body: CustomScrollView(slivers: [ProductGridViewBlocBuilder()]),
      ),
    );
  }
}
