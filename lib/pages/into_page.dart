import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
            // app logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('assets/images/nike-logo.png', height: 240),
            ),
          
            const SizedBox(height: 48,),
          
          
            // hero text
            const Text('Just Do It',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          
          
            const SizedBox(height: 24),
          
            // subtitle text
            const Text('Brand new sneakers and Custom kicks made with premium quality just for you',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          
            const SizedBox(height: 48),
            // button to continue
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(25.0),
                width: double.infinity,
              
                child: const Text('Shop Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                textAlign: TextAlign.center,
                ),
              
              ),
            )
            ]
          ),
        ),
      )
    );
  }
}