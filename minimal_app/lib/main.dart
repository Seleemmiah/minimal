import 'package:flutter/material.dart';
import 'package:minimal_app/models/shop.dart';
import 'package:minimal_app/pages/cart_page.dart';
import 'package:minimal_app/pages/shop_page.dart';
import 'package:minimal_app/themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
