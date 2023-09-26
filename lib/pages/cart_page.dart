import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/providers/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, int index) {
                final cartItem = cart[index];
                return Dismissible(
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            cartItem['title'].toString(),
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            cartItem['title'].toString(),
                          ),
                          backgroundColor: Colors.green,
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    }
                  },
                  key: Key(cartItem.toString()),
                  background: Container(color: Colors.red),
                  secondaryBackground: Container(color: Colors.green),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(cartItem['imageUrl'].toString()),
                    ),
                    title: Text(
                      cartItem['title'].toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text('Size:${cartItem['sizes']}'),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Delete Product',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  content: Text(
                                      "Are you sure you want to delete the product"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          context.read<CartProvider>().removeProduct(cartItem);
                                          // Provider.of<CartProvider>(context,
                                          //         listen: false)
                                          //     .removeProduct(cartItem);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    TextButton(
                                        onPressed: () => {
                                              Navigator.of(context).pop(),
                                            },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                        ))
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
                );
              }),
        ));
  }
}
