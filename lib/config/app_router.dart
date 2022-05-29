import 'package:first_project/models/models.dart';
import 'package:first_project/screens/home/home_screen.dart';
import 'package:first_project/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/product_model.dart';

class AppRouter { 
  static Route onGenerateRoute(RouteSettings settings) {
print('This is route settings: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(product: settings.arguments as Product);
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      default:
        return _errorRoute();
}
}

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),),)
    );
  }

}