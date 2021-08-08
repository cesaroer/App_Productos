import 'package:flutter/material.dart';
import 'package:productos_app/models/product.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = "flutter-varios-8ff33-default-rtdb.firebaseio.com";
  final List<Product> products = [];
}
