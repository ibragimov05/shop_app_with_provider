import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  Color color;
  String text;
  int price;

  Product({
    required this.id,
    required this.color,
    required this.text,
    required this.price,
  });

  void updateProduct(String newText, int newPrice) {
    text = newText;
    price = newPrice;
    notifyListeners();
  }
}
