import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable { 
  final String name;
  final String imageUrl;

  const Product({
    required this.name,
    required this.imageUrl,
  });


  @override
  List<Object?> get props => [name, imageUrl];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(name: snap['name'], imageUrl: snap['imageUrl']);
    return product;
  }
  }