import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/repositories/product/base_product_repository.dart';

import '../../models/product_model.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore.collection('product').snapshots().map((snapshot) {return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();});
  }
}