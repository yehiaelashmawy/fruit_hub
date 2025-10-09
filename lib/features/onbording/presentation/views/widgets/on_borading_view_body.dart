import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/onbording/presentation/views/widgets/on_borading_page_view.dart';

class OnBoradingViewBody extends StatelessWidget {
  const OnBoradingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoradingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            // ignore: deprecated_member_use
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
