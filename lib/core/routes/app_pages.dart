
import 'package:flutter/material.dart';

import 'package:create_order_app/feature/feature.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = AppRoutes.SPLASH;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.SPLASH:
        return MaterialPageRoute(builder: (_) => const Splash());

      case AppRoutes.BOTTOM_NAV:
        return MaterialPageRoute(builder: (_) => const BottomNavScreen());

      // case AppRoutes.REPO_DETAILS:
      //   final args = settings.arguments as Item;
      //   return MaterialPageRoute(builder: (_) =>  RepoDetails(item: args,));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }

  }


}










