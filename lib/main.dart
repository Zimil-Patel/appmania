import 'package:appmania/view/screens/cart_screen.dart';
import 'package:appmania/view/screens/Home/home_screen.dart';
import 'package:appmania/view/screens/product_screen.dart';
import 'package:appmania/view/screens/splash_screen.dart';
import 'package:appmania/view/screens/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const HomeScreen(),
      '/user': (context) => const UserProfile(),
      '/cart': (context) => const Cart(),
      '/product': (context) => const ProductScreen()
    },
  ));
}
