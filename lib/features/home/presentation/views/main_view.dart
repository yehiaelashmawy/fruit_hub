import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/home_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/product_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/profile_view.dart';

import 'widget/custom_bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentViewIndex,
        onTap: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
      body: SafeArea(child: getCurrentView()),
    );
  }

  Widget getCurrentView() {
    return const [
      HomeView(),
      ProductView(),
      CartView(),
      ProfileView(),
    ][currentViewIndex];
  }
}
