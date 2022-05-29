import 'package:first_project/models/models.dart';
import 'package:first_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:first_project/blocs/recommended/recommended_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product/product_bloc.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(product: product),
    );
  }

  final Product product;
  const CatalogScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Katalog'),
        bottomNavigationBar: CustomNavBar(),
        body: BlocBuilder<RecommendedBloc, RecommendedState>(
            builder: (context, state) {
          if (state is RecommendedLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecommendedLoaded) {
            final List<Recommended> recommendedProducts =
                state.recommended.toList();
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.15,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 250),
                itemCount: recommendedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: RecommendedCard(
                      recommended: recommendedProducts[index],
                      widthFactor: 2.2,
                    ),
                  );
                });
          } else {
            return Text('Hata oluştu!');
          }
        }));
  }
}
