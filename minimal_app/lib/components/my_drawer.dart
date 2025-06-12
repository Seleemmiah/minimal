import 'package:flutter/material.dart';
import 'package:minimal_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 70,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              // shop tile
              MyListTile(
                text: 'Shop',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  // after popping the drawer,navigate to the shop page
                  Navigator.pushNamed(context, '/shop_page');
                },
              ),

              // cart tile
              MyListTile(
                text: 'Cart',
                icon: Icons.add_shopping_cart,

                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);
                  // navigate to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // exit
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: 'Exit',
              icon: Icons.logout,
              onTap:
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
