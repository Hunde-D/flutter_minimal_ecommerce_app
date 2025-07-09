
import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    // remove item from cart method
    void removeItemFromCart(String shoeId) {
      Provider.of<Cart>(context, listen: false).removeItem(shoeId);
    }

    return Consumer<Cart>(
      builder: (context, store, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: store.userCart.length,
                  itemBuilder: (context, index) {
                    CartItem item = store.userCart[index];
                    return Container(
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
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(item.shoe.image),
                        ),
                        title: Text(item.shoe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${item.totalItemPrice.toStringAsFixed(2)}'),
                            const SizedBox(width: 10),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  size: 15,
                                  color: Colors.red,
                                  // size: 10,
                                ),
                              ),
                              onTap: () => removeItemFromCart(item.shoe.id),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}