import 'package:flutter/material.dart';

import 'package:shopapp/pages/product_details.dart';
import 'package:shopapp/product_list.dart';
import 'package:shopapp/widgets/productcart.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  final List<String> filters = const [
    'All',
    'Addidas',
    'Nike',
    'Bata',
    'GoldStar'
  ];
  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Shoes\n',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: 'Collection',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                      border: border,
                      // enabledBorder: border,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (BuildContext context, index) {
                dynamic filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      selectedFilter = filter;
                    }),
                    child: Chip(
                      side: selectedFilter == filter
                          ? BorderSide(color: Colors.red)
                          : BorderSide(
                              color: Color.fromRGBO(220, 224, 228, 1),
                            ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(220, 224, 228, 1),
                      label: Text(
                        filter,
                        style: TextStyle(
                            fontFamily: 'Mooli',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: selectedFilter == filter
                                ? Colors.white
                                : Colors.black),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, int index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(product: product),
                      ),
                    )
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: (product['price'] as int).toDouble(),
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
