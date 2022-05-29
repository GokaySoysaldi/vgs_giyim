import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/blocs/cart/cart_bloc.dart';
import 'package:first_project/blocs/product/product_bloc.dart';
import 'package:first_project/blocs/recommended/recommended_bloc.dart';
import 'package:first_project/config/app_router.dart';
import 'package:first_project/repositories/product/product_repository.dart';
import 'package:first_project/repositories/recommended/recommended_repository.dart';
import 'package:flutter/material.dart';
import 'package:first_project/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme.dart';
import 'screens/home/home_screen.dart';
import 'widgets/custom_appbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository(),)..add(LoadProduct())),
        BlocProvider(create: (_) => RecommendedBloc(recommendedRepository: RecommendedRepository(),)..add(LoadRecommended())),
      ],
      child: MaterialApp(
      title: 'VGS Giyim',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      home: HomeScreen(),
    )
    );
  }
}

