import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_feild.dart';
import 'package:fruit_hub/core/widgets/password_feild.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/donnot_have_account_widget.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_boutton.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormFeild(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول ',
              ),
              SizedBox(height: 33),
              DonnotHaveAccountWidget(),
              SizedBox(height: 37),
              OrDivider(),
              SizedBox(height: 21),

              SocialLoginBoutton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              SizedBox(height: 16),
              Platform.isIOS
                  ? Column(
                      children: [
                        SocialLoginBoutton(
                          onPressed: () {},
                          image: Assets.imagesAppleIcon,
                          title: 'تسجيل بواسطة ابل',
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : SizedBox(),

              SocialLoginBoutton(
                onPressed: () {
                  context.read<SigninCubit>().signinWithFacebook();
                },
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
              SizedBox(height: 66),
            ],
          ),
        ),
      ),
    );
  }
}
