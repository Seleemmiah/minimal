import 'package:flutter/material.dart';
import 'package:minimal_app/components/my_button.dart';
import 'package:minimal_app/components/my_drawer.dart';
import 'package:minimal_app/models/products.dart';
import 'package:minimal_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show dialoag to confirm if the user want to remove
    // from cart
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text('Remove this item from  cart??'),
            actions: [
              // cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),

              // yes button
              MaterialButton(
                onPressed: () {
                  // pop dialogue box
                  Navigator.pop(context);

                  // remove from cart
                  context.read<Shop>().removeFromCart(product);
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  //pay button method
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text('USER WANTS TO PAY! Connects this app to your bank'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child:
                cart.isEmpty
                    ? Center(child: Text('Your cart is empty'))
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual item in cart
                        final item = cart[index];

                        // return as a cart tile UI
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
          ),
          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
