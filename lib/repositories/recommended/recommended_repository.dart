import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/repositories/recommended/base_recommended_repository.dart';

import '../../models/recommended_model.dart';

class RecommendedRepository extends BaseRecommendedRepository {

  final FirebaseFirestore _firebaseFirestore;
  RecommendedRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Recommended>> getAllRecommended() {
    return _firebaseFirestore.collection('recommended').snapshots().map((snapshot) {return snapshot.docs.map((doc) => Recommended.fromSnapshot(doc)).toList();});
  }
}