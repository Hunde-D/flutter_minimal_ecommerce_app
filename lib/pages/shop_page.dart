
import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/components/shoe_tile.dart';
import 'package:flutter_minimal_ecommerce_app/data/shoe_data.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:flutter_minimal_ecommerce_app/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add to cart method
  void addToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('search', style: TextStyle(
                color: Colors.grey
              ),),
              Icon(
                Icons.search,
                color: Colors.grey
                )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric( vertical: 25),
          child: Text('every one flies.. some fly longer than others', style: TextStyle(color: Colors.grey.shade600)),
        ),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hot Picks 🔥', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
              Text('See all', style: TextStyle(
                color: Colors.blue.shade600,
                fontWeight: FontWeight.bold
              )),
            ],
          ),
        ),
        const SizedBox(height: 10),

        Expanded(child: ListView.builder(
          itemCount: shoeStore.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final shoe = shoeStore[index];
            return ShoeTile(
              shoe: shoe,
              onAddToCart: () => addToCart(shoe),
            );
          }
        )
        ),

        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Divider(
            color: Colors.white,
          ),
        ),


      ]
    );
  }
}