import 'package:flutter/material.dart';
import 'package:shopapp/home.dart';
// import 'package:shopapp/product_details.dart';
// import 'package:shopapp/product_list.dart';
import 'package:shopapp/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(255, 0, 0, 1),
            primary: Color.fromRGBO(246, 97, 97, 1),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
