import 'package:equatable/equatable.dart';
import 'package:first_project/models/recommended_model.dart';

class Cart extends Equatable {

  final List<Recommended> recommended;

  const Cart({this.recommended = const <Recommended>[]});


num get subtotal => recommended.fold(0, (total, current) => total + current.price);
String get subtotalString => subtotal.toStringAsFixed(2);

num deliveryFee(subtotal) {
  if(subtotal >= 5000) {
    return 0.0;
  } else {
    return 100.0;
  }
}
String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

String freeDelivery(subtotal) {
  if(subtotal >= 5000.0) {
    return 'Ücretsiz Kargolanacak!';
  }else {
    num missing = 5000-subtotal;
    return 'Bedava Kargo için ₺${missing.toStringAsFixed(2)} Eksik';
  }
}
String get freeDeliveryString => freeDelivery(subtotal);


num total(subtotal, deliveryFee) {
  return subtotal + deliveryFee(subtotal);
}
String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);



  Map recommendedQuantity(recommended) {
    var quantity = Map();

    recommended.forEach((recommended) {
      if(!quantity.containsKey(recommended)) {
        quantity[recommended] = 1;
      } else {
        quantity[recommended] += 1;
      }
    });

    return quantity;
  }

  @override
  List<Object?> get props => [recommended];
}