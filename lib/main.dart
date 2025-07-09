import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:flutter_minimal_ecommerce_app/pages/into_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    ),
    );
  }
}