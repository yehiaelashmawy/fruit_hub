import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/home/presentation/views/main_view.dart';
import 'package:fruit_hub/features/onbording/presentation/views/on_borading_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

import '../../features/best_selling_fruit/presentation/view/best_selling_fruit_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoradingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoradingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    case BestSellingFruitView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BestSellingFruitView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
