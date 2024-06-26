import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/views/screen/cart_screen.dart';
import 'package:shop_app/views/screen/order_screen.dart';
import 'package:shop_app/views/widgets/manage_product.dart';
import 'package:shop_app/views/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const OrderScreen(),
              ),
            );
          },
          icon: const Icon(Icons.ac_unit),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const ManageProduct(isEdit: false),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const CartScreen()),
              ),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider<Product>.value(
          value: productController.products[index],
          builder: (BuildContext context, Widget? child) => const ProductItem(),
        ),
      ),
    );
  }
}
