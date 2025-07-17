import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/components/shoe_tile.dart';
import 'package:flutter_minimal_ecommerce_app/data/shoe_data.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:flutter_minimal_ecommerce_app/models/shoe.dart';
import 'package:flutter_minimal_ecommerce_app/pages/see_all_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Shoe> filteredShoes = [];

  @override
  void initState() {
    super.initState();
    filteredShoes = shoeStore; // Initially show all shoes
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredShoes = shoeStore.where((shoe) {
        return shoe.name.toLowerCase().contains(query) ||
            shoe.description.toLowerCase().contains(query);
      }).toList();
    });
  }
  // add to cart method
  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search shoes...',
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text('every one flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey.shade600)),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hot Picks 🔥',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeeAllPage()),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: filteredShoes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = filteredShoes[index];
                    return ShoeTile(
                      shoe: shoe,
                      onAddToCart: () => addToCart(shoe),
                    );
                  })),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
