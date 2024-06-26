import 'package:shop_app/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime dateTime;

  const Order({
    required this.id,
    required this.products,
    required this.dateTime,
  });
}
