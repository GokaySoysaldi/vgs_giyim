import 'package:first_project/models/models.dart';

abstract class BaseProductRepository {
  Stream <List<Product>> getAllProduct();
}