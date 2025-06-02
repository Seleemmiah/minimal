import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 70,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(height: 25),

            // title
            Text(
              'Minimal Shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SizedBox(height: 10),

            //subtitle
            Text(
              'Premiun Quality Products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            //button
          ],
        ),
      ),
    );
  }
}
