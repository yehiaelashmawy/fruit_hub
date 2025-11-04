import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_style.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        'يحيى عبدالحليم',
        textAlign: TextAlign.right,
        style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: NotifactionWidget(),
    );
  }
}
