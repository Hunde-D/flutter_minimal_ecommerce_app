import 'package:flutter/material.dart';
import 'package:flutter_minimal_ecommerce_app/components/bottom_nav_bar.dart';
import 'package:flutter_minimal_ecommerce_app/models/cart.dart';
import 'package:flutter_minimal_ecommerce_app/pages/cart_page.dart';
import 'package:flutter_minimal_ecommerce_app/pages/shop_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // selected tab index
  int selectedTabIndex = 0;
  
  // method to handle tab changes
  void navigateOnTabChange(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  // pages to navigate to
  final List<Widget> pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateOnTabChange(index),
        cartItemCount: Provider.of<Cart>(context).items.length,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  Builder(
          builder: (context) => IconButton(
            onPressed: () { 
              Scaffold.of(context).openDrawer();
            }, 
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset('assets/images/nike-logo.png', height: 100, color: Colors.white,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text('Home', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: const Text('About', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Log Out', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    selectedTabIndex = 1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedTabIndex],
    );
  }
}
