import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onbording/presentation/views/widgets/on_borading_page_view.dart';

class OnBoradingViewBody extends StatelessWidget {
  const OnBoradingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [Expanded(child: OnBoradingPageView())]);
  }
}
