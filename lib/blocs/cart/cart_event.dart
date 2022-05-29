part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final Recommended recommended;
  const CartProductAdded(this.recommended);
  @override
  List<Object> get props => [recommended];
}

class CartProductRemoved extends CartEvent {
  final Recommended recommended;
  const CartProductRemoved(this.recommended);
  @override
  List<Object> get props => [recommended];
}

