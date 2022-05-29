import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:first_project/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) ;
  @override
  Stream<CartState> mapEventToState(CartEvent event,) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartProductAdded) {
      yield* _mapCartProductAddedToState(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapProductRemovedToState(event, state);
    }
  }
  
  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield CartLoaded();
    }
    catch (_) {}
  }

  Stream <CartState> _mapCartProductAddedToState(
    CartProductAdded event,
    CartState state
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(cart: Cart(recommended: List.from(state.cart.recommended)..add(event.recommended)));
      }
      catch(_) {}
    }
  }

  Stream <CartState> _mapProductRemovedToState(
    CartProductRemoved event,
    CartState state
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(cart: Cart(recommended: List.from(state.cart.recommended)..remove(event.recommended)));
      }
      catch(_) {}
    }
  }
}
