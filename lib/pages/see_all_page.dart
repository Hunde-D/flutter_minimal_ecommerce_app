import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/components/shoe_tile_all.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:flutter_minimal_ecommerce_app/models/shoe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  List<Shoe> shoes = [];
  bool isLoading = true;
  bool hasError = false;

  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);
  }

  @override
  void initState() {
    super.initState();
    fetchShoes();
  }

  Future<void> fetchShoes() async {
    try {
      final response = await http
          .get(Uri.https('dummyjson.com', '/products/category/mens-shoes'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List products = data['products'];
        setState(() {
          shoes = products.map((item) => Shoe.fromJson(item)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Men's Shoes"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          'Failed to load shoes. Please check your connection.'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            hasError = false;
                          });
                          fetchShoes();
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(right: 16.0),
                  itemCount: shoes.length,
                  itemBuilder: (context, index) {
                    final shoe = shoes[index];
                    return ShoeTileAll(
                      shoe: shoe,
                      onAddToCart: () => addToCart(shoe),
                    );
                  },
                ),
    );
  }
}
