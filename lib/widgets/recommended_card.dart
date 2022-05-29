import 'package:first_project/blocs/cart/cart_bloc.dart';
import 'package:first_project/models/recommended_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedCard extends StatelessWidget {
  final Recommended recommended;
  final double widthFactor;
  const RecommendedCard({
    Key? key,
    required this.recommended,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 1,
          child: Image.network(
            recommended.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 215,
          child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recommended.name,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(CartProductAdded(recommended));
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 20,
                                )));
                        }
                        else {
                          return Text('Hata oluştu!');
                        }
                      },
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
