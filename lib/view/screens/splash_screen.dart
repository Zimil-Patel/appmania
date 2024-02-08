import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/home');
          },
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 150),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 20),
                child: Text(
                  'App Mania',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
