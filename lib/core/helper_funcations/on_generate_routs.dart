import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onbording/presentation/views/on_borading_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoradingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoradingView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
