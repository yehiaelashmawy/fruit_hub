import 'package:flutter/material.dart';
import 'package:fruit_hub/constans.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/service/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/views/signin_view.dart';
import 'package:fruit_hub/features/onbording/presentation/views/on_borading_view.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../home/presentation/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottum, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isSignedIn = FirebaseAuthService().isSignedIn();
        if (isSignedIn) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, OnBoradingView.routeName);
      }
    });
  }
}
