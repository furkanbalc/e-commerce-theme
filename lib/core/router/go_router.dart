import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/bottom/app.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:my_theme/screens/bag/my_bag.dart';
import 'package:my_theme/screens/categories/categories.dart';
import 'package:my_theme/screens/categories/sub_categories.dart';
import 'package:my_theme/screens/favorites/favorites.dart';
import 'package:my_theme/screens/forgot_password/forgot_password.dart';
import 'package:my_theme/screens/home/home.dart';
import 'package:my_theme/screens/login/login.dart';
import 'package:my_theme/screens/product_detail/product_detail.dart';
import 'package:my_theme/screens/profile/addresses/adding_shipping_address.dart';
import 'package:my_theme/screens/profile/addresses/shipping_addresses.dart';
import 'package:my_theme/screens/profile/my_orders/my_orders.dart';
import 'package:my_theme/screens/profile/my_orders/order_details.dart';
import 'package:my_theme/screens/profile/profile.dart';
import 'package:my_theme/screens/profile/settings/settings.dart';
import 'package:my_theme/screens/signup/signup.dart';
import 'package:my_theme/screens/splash/splash.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: 'shell');

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _instance;

  static AppRoutes get instance => _instance ??= AppRoutes._();

  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouteName.splash.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRouteName.splash.name,
        path: AppRouteName.splash.path,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: AppRouteName.login.name,
        path: AppRouteName.login.path,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        name: AppRouteName.signup.name,
        path: AppRouteName.signup.path,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        name: AppRouteName.forgotPassword.name,
        path: AppRouteName.forgotPassword.path,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) => App(child: child),
        routes: [
          GoRoute(
            path: AppRouteName.home.path,
            name: AppRouteName.home.name,
            builder: (BuildContext context, GoRouterState state) => const HomeView(),
            routes: [
              GoRoute(
                path: AppRouteName.productDetail.path,
                name: '${AppRouteName.productDetail.name}_home',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProductDetailView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.categories.path,
            name: AppRouteName.categories.name,
            builder: (BuildContext context, GoRouterState state) => const CategoriesView(),
            routes: [
              GoRoute(
                path: AppRouteName.subCategories.path,
                name: AppRouteName.subCategories.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const SubCategoriesView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.bag.path,
            name: AppRouteName.bag.name,
            builder: (BuildContext context, GoRouterState state) => const MyBagView(),
            routes: [
              GoRoute(
                path: '${AppRouteName.productDetail.path}_bag',
                name: '${AppRouteName.productDetail.name}_bag',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProductDetailView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.favorites.path,
            name: AppRouteName.favorites.name,
            builder: (BuildContext context, GoRouterState state) => const FavoritesView(),
            routes: [
              GoRoute(
                path: '${AppRouteName.productDetail.path}_fav',
                name: '${AppRouteName.productDetail.name}_fav',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProductDetailView();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.profile.path,
            name: AppRouteName.profile.name,
            builder: (BuildContext context, GoRouterState state) => const ProfileView(),
            routes: [
              GoRoute(
                path: AppRouteName.addresses.path,
                name: AppRouteName.addresses.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ShippingAddressesView();
                },
                routes: [
                  GoRoute(
                    path: AppRouteName.addAddress.path,
                    name: AppRouteName.addAddress.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AddingShippingAddressView();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: AppRouteName.myOrders.path,
                name: AppRouteName.myOrders.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const MyOrdersView();
                },
                routes: [
                  GoRoute(
                    path: AppRouteName.orderDetails.path,
                    name: AppRouteName.orderDetails.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const OrderDetailView();
                    },
                  ),
                ],
              ),
              GoRoute(
                path: AppRouteName.settings.path,
                name: AppRouteName.settings.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsView();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
