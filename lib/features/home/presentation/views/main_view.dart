import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widget/home_view.dart';

import 'widget/custom_bottom_navigation_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
