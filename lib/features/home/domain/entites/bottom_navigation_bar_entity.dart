import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImade, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImade,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImade: Assets.imagesActiveHomeIcon,
    inActiveImage: Assets.imagesHomeIcon,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImade: Assets.imagesActiveProductsIcon,
    inActiveImage: Assets.imagesProductsIcon,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImade: Assets.imagesActiveCartIcon,
    inActiveImage: Assets.imagesCartIcon,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImade: Assets.imagesActiveProfileIcon,
    inActiveImage: Assets.imagesProfileIcon,
    name: 'حسابي',
  ),
];
