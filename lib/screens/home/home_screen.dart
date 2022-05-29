import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/blocs/recommended/recommended_bloc.dart';
import 'package:first_project/models/models.dart';
import 'package:first_project/widgets/smart_title.dart';
import 'package:first_project/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'VGS Giyim'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayInterval: Duration(seconds: 5),
                    ),
                    items: state.product
                        .map((product) => HeroCarouselCard(product: product))
                        .toList(),
                  );
                } else {
                  return Text('Hata oluştu!');
                }
              },
            ),
          ),
          SectionTitle(
            title: 'Öne Çıkanlar',
          ),
          SizedBox(
            height: 5,
          ),
          SmartTitle(title: 'Bizim için değerlisiniz...'),
          SizedBox(
            height: 10,
          ),
          //Recommended Card
          BlocBuilder<RecommendedBloc, RecommendedState>(
            builder: ((context, state) {
              if (state is RecommendedLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RecommendedLoaded) {
                return RecommendedCarousel(recommended: state.recommended);
              } else {
                return Text('Hata oluştu!');
              }
            }),
          )
        ],
      ),
    );
  }
}
