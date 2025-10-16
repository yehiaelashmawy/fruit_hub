import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isCheked,
    required this.onChanged,
  });
  final bool isCheked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isCheked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isCheked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isCheked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        duration: Duration(milliseconds: 100),

        child: isCheked
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(Assets.imagesCheckIcon),
              )
            : SizedBox(),
      ),
    );
  }
}
