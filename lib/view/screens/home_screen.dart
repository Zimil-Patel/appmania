import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/users/user_data.dart';
import 'package:flutter/material.dart';

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
        paritionLine(),
        //grey parition line

        //main body
        Expanded(
          child: Container(),
        )
      ],
    ));
  }

  //custom app bar
  Widget customAppBar() {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          //app bar left part
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/user');
            },
            child: Row(
              children: [
                //circular user avatar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'asset/images/avatar.png',
                      height: 42,
                      width: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //user name
                Text(
                  firstName,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),

          //app bar center side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Delivery address',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
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
          ),

          //app bar left side
          Container(
            margin: EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: gray95, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                ),
                Text(
                  '  Cart',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
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
}
