import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';

class DonnotHaveAccountWidget extends StatelessWidget {
  const DonnotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: TextStyles.semiBold16.copyWith(color: const Color(0xFF949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignupView.routeName);
          },
          child: Text(
            ' قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
