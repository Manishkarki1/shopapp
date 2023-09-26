// import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  // final price;
  ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 5),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Rs. ${price}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                // child: Image(
                //   image: AssetImage(image),
                //   height: 150,
                // ),

                child: Image.asset(
                  image,
                  height: 175,
                ),
              ),
            ),
          ],
        ));
  }
}
