import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductController extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: UniqueKey().toString(),
      color: Colors.grey,
      text: 'Iphone 15',
      price: 1200,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.blue,
      text: 'Samsung Galaxy S21',
      price: 999,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.black,
      text: 'Google Pixel 6',
      price: 799,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.red,
      text: 'OnePlus 9',
      price: 729,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.green,
      text: 'Xiaomi Mi 11',
      price: 749,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.orange,
      text: 'Sony Xperia 5',
      price: 899,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.purple,
      text: 'Oppo Find X3',
      price: 799,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.brown,
      text: 'Huawei P50',
      price: 699,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.yellow,
      text: 'LG Velvet',
      price: 599,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.pink,
      text: 'Asus ROG Phone 5',
      price: 999,
    ),
    Product(
      id: UniqueKey().toString(),
      color: Colors.cyan,
      text: 'Nokia 8.3',
      price: 649,
    ),
  ];

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void editProduct(String productId, String newTitle, int newPrice) {
    int index = _products.indexWhere((element) => element.id == productId);
    if (index != -1) {
      _products[index].updateProduct(newTitle, newPrice);
    }
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _products.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
