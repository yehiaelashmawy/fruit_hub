import 'package:flutter/material.dart';
import 'package:fruit_hub/constans.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_feild.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormFeild(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),

            const CustomTextFormFeild(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),

            CustomTextFormFeild(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFFC9CECF),
                ),
              ),
            ),
            SizedBox(height: 16),
            TermsAndConditions(),
            SizedBox(height: 30),
            CustomButton(onPressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 26),
            HaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
