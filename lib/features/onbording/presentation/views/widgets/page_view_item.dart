import 'package:flutter/material.dart';
import 'package:fruit_hub/constans.dart';
import 'package:fruit_hub/core/service/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/features/auth/presentation/views/signin_view.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.57,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: Positioned(
                  top: 40,
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(kIsOnBoardingViewSeen, true);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(SigninView.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'تخط',
                        style: TextStyles.regular13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subTitle,
            style: TextStyles.semiBold13.copyWith(color: Color(0xFF4E5556)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
