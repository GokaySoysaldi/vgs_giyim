import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Recommended extends Equatable {
  final String name;
  final String imageUrl;
  final num price;

  const Recommended({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  @override
  List<Object?> get props => [name, imageUrl, price];

  static Recommended fromSnapshot(DocumentSnapshot snap) {
    Recommended recommended = Recommended(
        name: snap['name'], imageUrl: snap['imageUrl'], price: snap['price']);
    return recommended;
  }
}
