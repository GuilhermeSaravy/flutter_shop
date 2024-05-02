import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Tem certeza?'),
                          content: const Text(
                              'Tem certeza que deseja excluir o produto?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                child: const Text('Não')),
                            TextButton(
                                onPressed: () {
                                  Provider.of<ProductList>(context,
                                          listen: false)
                                      .removeProduct(product);
                                  Navigator.of(ctx).pop(true);
                                },
                                child: const Text('Sim')),
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
              color: Colors.red[400],
            ),
          ],
        ),
      ),
    );
  }
}
