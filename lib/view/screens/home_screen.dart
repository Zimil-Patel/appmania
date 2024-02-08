import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/users/user_data.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //custom app/top bar
        customAppBar(),
        //paritionLine(),
        //grey parition line

        //main body
        Expanded(
          child: ScrollShadowContainer(
            elevation: MaterialElevation.the2dp,
            child: ListView(
              children: List.generate(20, (i) {
                return ListTile(
                  leading: CircleAvatar(child: Text((i + 1).toString())),
                  title: Text('List item title'),
                  subtitle: Text('List item subtitle'),
                );
              }),
            ),
          ),
        )
      ],
    ));
  }

  //custom app bar
  AppBar customAppBar() {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          navigateTo('/user');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'asset/images/avatar.png',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Delivery address',
            style: TextStyle(
                fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Text(
            address,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            navigateTo('/cart');
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.only(right: 14, left: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: gray95, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                ),
                Text(
                  ' Cart',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //parition line
  Widget paritionLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 1.5,
        color: gray95,
      ),
    );
  }

  void navigateTo(String screenName) {
    Navigator.of(context).pushNamed(screenName);
  }
}
