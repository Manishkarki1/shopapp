import 'package:flutter/material.dart';
import 'package:shopapp/product_list.dart';
// import 'package:shopapp/productcart.dart';
import 'package:shopapp/providers/provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'sizes': selectedSize,
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Product Added!'),
        duration: Duration(milliseconds: 560),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select a size'),
        duration: Duration(milliseconds: 560),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Spacer(),
        Image.asset(widget.product['imageUrl'] as String, height: 250),
        Spacer(
          flex: 2,
        ),
        Container(
          // width: 250,
          decoration: BoxDecoration(
            color: Color.fromRGBO(216, 240, 253, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rs. ${widget.product['price']}',
                style: TextStyle(
                  fontFamily: 'Mooli',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Size:',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 3, 46, 81)),
                    )),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.product['sizes'] as List<int>).length,
                  itemBuilder: (context, int index) {
                    final size = (widget.product['sizes'] as List<int>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          selectedSize = size;
                        }),
                        child: Chip(
                          label: Text(
                            size.toString(),
                          ),
                          backgroundColor: selectedSize == size
                              ? Color.fromRGBO(183, 214, 246, 1)
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: onTap,
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_cart,
                      size: 32,
                    ),
                    title: Center(
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
