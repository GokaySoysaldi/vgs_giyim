import 'package:first_project/models/models.dart';

abstract class BaseRecommendedRepository {
  Stream<List<Recommended>> getAllRecommended();
}