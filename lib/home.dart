import 'package:flutter/material.dart';
import 'package:shopapp/cart_page.dart';
import 'package:shopapp/product_details.dart';
import 'package:shopapp/product_home.dart';
import 'package:shopapp/product_list.dart';
import 'package:shopapp/productcart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [ProductHome(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 26,
          currentIndex: currentPage,
          onTap: (value) => setState(() {
                currentPage = value;
              }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              tooltip: 'Cart',
            )
          ]),
    );
  }
}
