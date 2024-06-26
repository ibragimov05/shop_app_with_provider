import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/views/widgets/manage_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Text(
        product.text,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("\$${product.price}"),
      trailing: Consumer<CartController>(
        builder:
            (BuildContext context, CartController controller, Widget? child) {
          return controller.isInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeFromCart(product.id);
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      controller.getProductAmount(product.id).toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                    editWidget(context, product),
                    deleteWidget(context, product.id),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.addToCart(product);
                      },
                      icon: const Icon(Icons.add),
                    ),
                    editWidget(context, product),
                    deleteWidget(context, product.id),
                  ],
                );
        },
      ),
    );
  }

  Widget editWidget(BuildContext context, Product product) => IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ManageProduct(
              isEdit: true,
              product: product,
            ),
          );
        },
        icon: const Icon(Icons.edit),
      );

  Widget deleteWidget(BuildContext context, String productId) =>
      Consumer<ProductController>(
        builder:
            (BuildContext context, ProductController value, Widget? child) =>
                IconButton(
          onPressed: () {
            value.deleteProduct(productId);
          },
          icon: const Icon(Icons.delete),
        ),
      );
}
