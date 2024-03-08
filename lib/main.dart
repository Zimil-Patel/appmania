import 'package:appmania/view/screens/Cart/cart_screen.dart';
import 'package:appmania/view/screens/Home/home_screen.dart';
import 'package:appmania/view/screens/Product/product_screen.dart';
import 'package:appmania/view/screens/Splash/splash_screen.dart';
import 'package:appmania/view/screens/User/user_screen.dart';
import 'package:flutter/material.dart';

//Good morning...
void main() {
  runApp(MaterialApp(
    title: 'Digital Cart',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const HomeScreen(),
      '/user': (context) => const UserProfile(),
      '/cart': (context) => const Cart(),
      '/product': (context) => const ProductScreen()
    },
  ));
}
