import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onbording/presentation/views/widgets/on_borading_view_body.dart';

class OnBoradingView extends StatelessWidget {
  const OnBoradingView({super.key});

  static const String routeName = 'onBoradingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnBoradingViewBody());
  }
}
