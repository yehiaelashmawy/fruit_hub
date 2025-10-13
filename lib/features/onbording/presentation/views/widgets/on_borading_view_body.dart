import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constans.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/onbording/presentation/views/widgets/on_borading_page_view.dart';

class OnBoradingViewBody extends StatefulWidget {
  const OnBoradingViewBody({super.key});

  @override
  State<OnBoradingViewBody> createState() => _OnBoradingViewBodyState();
}

class _OnBoradingViewBodyState extends State<OnBoradingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoradingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            // ignore: deprecated_member_use
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
