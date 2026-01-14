import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          final index = e.key;
          final entity = e.value;

          return Expanded(
            flex: index == currentIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () => onTap(index),
              child: NavigationBarItem(
                bottomNavigationBarItems: entity,
                isSelected: currentIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
