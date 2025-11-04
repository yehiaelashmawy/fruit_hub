import 'package:flutter/widgets.dart';
import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_item.dart' show ActiveItem;
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarItems,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarItems;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarItems.activeImade,
            text: bottomNavigationBarItems.name,
          )
        : InActiveItem(image: bottomNavigationBarItems.inActiveImage);
  }
}
