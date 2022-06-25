import 'package:anywash/home/bottom.dart';
import 'package:anywash/login_password/login.dart';
import 'package:anywash/login_password/register.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String passwordPage = 'password_page';
  static const String locationPage = 'location_page';
  static const String homeOrderAccountPage = 'home_order_account';
  static const String homePage = 'home_page';
  static const String accountPage = 'account_page';
  static const String orderPage = 'order_page';
  static const String items = 'items';
  static const String tncPage = 'tnc_page';
  static const String savedAddressesPage = 'saved_addresses_page';
  static const String supportPage = 'support_page';
  static const String loginNavigator = 'login_navigator';
  static const String orderMapPage = 'order_map_page';
  static const String chatPage = 'chat_page';
  static const String viewCart = 'view_cart';
  static const String orderPlaced = 'order_placed';
  static const String paymentMethod = 'payment_method';
  static const String wallet = 'wallet_page';
  static const String addMoney = 'addMoney_page';
  static const String settings = 'settings_page';
  static const String review = 'reviews';
  static const String rate = 'rateNow';
  static const String selectLocation = 'selectLocation';
  static const String slideUpPanel = "slide_up_panel";
  static const String storesPage = 'storesPage';
  static const String deliveryOptionsPage = 'deliveryOptionsPage';
  static const String cleaningServicePage = "cleaning_service_page";
  static const String cleaningServiceCategoriesPage =
      "cleaning_service_category_page";
  static const String loginRoute = 'signIn/';
  static const String signupRoute = 'login/signUp';
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case PageRoutes.signupRoute:
        return MaterialPageRoute(builder: (_) => const Register());
      case PageRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case PageRoutes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
