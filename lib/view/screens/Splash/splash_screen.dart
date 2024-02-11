import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/home'));

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20)
                  ),
                  child: Image.asset('asset/images/splashLogo.jpeg')),

              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 80),
                child: Text(
                  'Digital Cart...',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
