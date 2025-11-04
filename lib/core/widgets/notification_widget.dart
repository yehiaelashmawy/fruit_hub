import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../utils/app_images.dart';

class NotifactionWidget extends StatelessWidget {
  const NotifactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
