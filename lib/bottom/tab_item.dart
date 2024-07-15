import 'package:my_theme/constants/assets.dart';

enum TabItem {
  home('Home', Assets.zaraSvgHomeOutlined, Assets.zaraSvgHomeFilled),
  shop('Shop', Assets.zaraSvgShopOutlined, Assets.zaraSvgShopFilled),
  bag('Bag', Assets.zaraSvgBagOutlined, Assets.zaraSvgBagFilled),
  favorites('Favorites', Assets.zaraSvgFavoritesOutlined, Assets.zaraSvgFavoritesFilled),
  profile('Profile', Assets.zaraSvgProfileOutlined, Assets.zaraSvgProfileFilled),
  ;

  final String name;
  final String outlined;
  final String filled;

  const TabItem(this.name, this.outlined, this.filled);
}
