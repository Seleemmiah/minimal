import 'package:flutter/material.dart';
import 'package:minimal_app/models/products.dart';
import 'package:minimal_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  // productv tile ui
  final Product product;

  const MyProductTile({super.key, required this.product});

  // add to cart method
  void addToCart(BuildContext context) {
    // show dialoag to confirm if the user want to add
    // to cart
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text('Add this item to your cart??'),
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

                  // add to cart
                  context.read<Shop>().addToCart(product);
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),

              SizedBox(height: 25),

              // product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              SizedBox(height: 10),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 25),

          // Product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price
              Text('\$' + product.price.toStringAsFixed(2)),

              // add button to cart
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
