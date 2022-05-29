import 'dart:async';

import 'package:first_project/models/models.dart';
import 'package:first_project/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('VGS Giyim', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),),
        )
      ],));
  }
}
