import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_feild.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/donnot_have_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_boutton.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 4,
          children: [
            SizedBox(height: 24),
            CustomTextFormFeild(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    height: 1.7,
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول '),
            SizedBox(height: 33),
            DonnotHaveAccountWidget(),
            SizedBox(height: 37),
            OrDivider(),
            SizedBox(height: 21),

            SocialLoginBoutton(
              onPressed: () {},
              image: Assets.imagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(height: 16),
            SocialLoginBoutton(
              onPressed: () {},
              image: Assets.imagesAppleIcon,
              title: 'تسجيل بواسطة ابل',
            ),
            SizedBox(height: 16),
            SocialLoginBoutton(
              onPressed: () {},
              image: Assets.imagesFacebookIcon,
              title: 'تسجيل بواسطة فيسبوك',
            ),
            SizedBox(height: 66),
          ],
        ),
      ),
    );
  }
}
