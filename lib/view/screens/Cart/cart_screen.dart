import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/lists/cart_list.dart';
import 'package:appmania/utils/lists/product_data.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

import '../../../utils/users/user_data.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

late double width;
double totalAmt = getTotal();

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "refresh");
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.circular(100)),
            child: Icon(
              Icons.more_horiz,
              size: 24,
              color: Colors.grey.shade400,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          //ADDRESS BAR
          centerBar(),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ScrollShadowContainer(
                elevation: MaterialElevation.the2dp,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //TOP BAR
                      addTopBar(),

                      //PRODUCT LIST
                      ...List.generate(
                          carList.length, (index) => productBox(index: index))
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(14),
            height: 100,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                //BUTTON
                checkOut(),

                //ADDRESS OF DELIVERY
                const Spacer(),
                Text(
                  'Total : \$ ${totalAmt.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //center bar
  Widget centerBar() {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(Icons.location_on_outlined,
                  size: 22, color: Colors.grey.shade400),
            ),
            const SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                address,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(Icons.arrow_forward_ios_outlined,
                  size: 18, color: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }

  //TOP BAR
  Widget addTopBar() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.check_box_rounded,
            size: 22,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Text(
            'Select All',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        Icon(
          Icons.ios_share,
          size: 22,
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(
            Icons.edit,
            size: 22,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  //PRODUCT BOX
  Widget productBox({required int index}) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.check_box_rounded,
              size: 22,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 120,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(20),
              child: Image.asset(carList[index]['img']),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 18),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            carList[index]['name'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                for (int i = 0; i < productData1.length; i++) {
                                  if (carList[index]['id'] ==
                                      productData1[i]['id']) {
                                    productData1[i]['inCart'] = false;
                                    productData1[i]['quantity'] = 0;
                                  }
                                }
                                setState(() {
                                  carList.removeAt(index);
                                  totalAmt = getTotal();
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.grey,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\$${carList[index]['price']}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius:
                                    BorderRadiusDirectional.circular(100)),
                            child: IconButton(
                                alignment: Alignment.center,
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    if (carList[index]['quantity'] > 1) {
                                      carList[index]['quantity']--;
                                    }
                                    totalAmt = getTotal();
                                  });

                                  for (int i = 0;
                                      i < productData1.length;
                                      i++) {
                                    if (carList[index]['id'] ==
                                        productData1[i]['id']) {
                                      productData1[i]['quantity'] =
                                          carList[index]['quantity'];
                                    }
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 14,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${carList[index]['quantity']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius:
                                    BorderRadiusDirectional.circular(100)),
                            child: IconButton(
                                alignment: Alignment.center,
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    carList[index]['quantity']++;
                                    totalAmt = getTotal();
                                  });
                                  for (int i = 0;
                                      i < productData1.length;
                                      i++) {
                                    if (carList[index]['id'] ==
                                        productData1[i]['id']) {
                                      productData1[i]['quantity'] =
                                          carList[index]['quantity'];
                                    }
                                  }
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 14,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget checkOut() {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: lightGreenContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10))),
        onPressed: () {},
        child: Text(
          'Checkout',
          style: TextStyle(
              color: fontColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

double getTotal() {
  double totalAmt = 0;

  for (int i = 0; i < carList.length; i++) {
    totalAmt += (carList[i]['price'] * carList[i]['quantity']);
  }

  return totalAmt;
}
