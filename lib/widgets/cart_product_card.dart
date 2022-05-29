import 'package:first_project/blocs/cart/cart_bloc.dart';
import 'package:first_project/models/recommended_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Recommended recommended;
  final int quantity;
  const CartProductCard({Key? key, required this.recommended, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            recommended.imageUrl,
            height: 150,
            width: 82,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommended.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                ),
                Text(
                  '₺${recommended.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(CartProductRemoved(recommended));
                  }, icon: Icon(Icons.remove_circle)),
                  Text(
                    '$quantity',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 13),
                  ),
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(CartProductAdded(recommended));
                  }, icon: Icon(Icons.add_circle)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
