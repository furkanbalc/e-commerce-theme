enum AppRouteName {
  splash('/', 'Splash'),
  login('/login', 'Login'),
  signup('/signup', 'Signup'),
  forgotPassword('/forgotPassword', 'ForgotPassword'),
  home('/home', 'Home'),
  categories('/categories', 'Categories'),
  subCategories('subCategories', 'SubCategories'),
  bag('/bag', 'Bag'),
  productDetail('productDetail', 'ProductDetail'),
  favorites('/favorites', 'Favorites'),
  profile('/profile', 'Profile'),
  addresses('addresses', 'Addresses'),
  addAddress('addAddress', 'AddAddress'),
  myOrders('myOrders', 'MyOrders'),
  orderDetails('orderDetails', 'OrderDetails'),
  settings('settings', 'Settings'),
  ;

  const AppRouteName(this.path, this.name);

  final String path;
  final String name;
}
