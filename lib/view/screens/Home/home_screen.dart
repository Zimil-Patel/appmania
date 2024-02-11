import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/lists/image_list.dart';
import 'package:appmania/utils/lists/product_data.dart';
import 'package:appmania/utils/users/user_data.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

import '../product_screen.dart';
import 'glass_morphism.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: customAppBar(),
        body: Column(
          children: [

            //center bar
            centerBar(),

            //partition bar
            partitionLine(),

            Expanded(
                child: ScrollShadowContainer(
                    elevation: MaterialElevation.the2dp,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //OFFER BANNER AND FAVOURITES
                          offerAndFavouriteBox(),

                          partitionLine(),

                          //popular brand list
                          brandBox(),

                          //product list
                          productList()
                        ],
                      ),
                    )))
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
          Text(
            'Delivery address',
            style: TextStyle(
                fontSize: 12,
                color: lightFontColor,
                fontWeight: FontWeight.w500),
          ),
          Text(
            address,
            style: TextStyle(
                fontSize: 15, color: fontColor, fontWeight: FontWeight.w600),
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
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
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
                      color: fontColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  //center bar
  Widget centerBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: Row(
        children: [
          //search bar
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.search_outlined),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Search item',
                        style: TextStyle(
                            color: lightFontColor, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          //filter bar
          Container(
            width: 90,
            height: 40,
            padding: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Filter',
                  style: TextStyle(
                      color: lightFontColor, fontWeight: FontWeight.w400),
                ),
                const Icon(Icons.filter_alt_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //partition line
  Widget partitionLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 1.5,
        color: primaryColor,
      ),
    );
  }

  //offer and favourite bar
  Widget offerAndFavouriteBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: height / 4.8,
        decoration: BoxDecoration(
          color: lightGreenContainer,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            //favourite text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 14, right: 14),
                child: GlassMorphism(
                  blur: 20,
                  opacity: 0.2,
                  child: Container(
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Favourites',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: fontColor),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_right_rounded),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //favourite list
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(offerImg.length,
                          (index) => offerImageContainer(offerImg[index]))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget offerImageContainer(String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: lightSkinContainer, borderRadius: BorderRadius.circular(25)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
              height: 200,
            )),
      ),
    );
  }

  //popular brands container
  Widget brandBox() {
    return Container(
      alignment: Alignment.center,
      height: height / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          //popular brand text
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: whiteContainer,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Popular Brands',
                          style: TextStyle(
                              color: fontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: lightFontColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),

          //favourite list
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(brandImg.length,
                      (index) => brandImageContainer(brandImg[index]))),
            ),
          ),
        ],
      ),
    );
  }

  Widget brandImageContainer(String imgUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: whiteContainer,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, spreadRadius: 0, color: Colors.grey.shade300)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
                height: 40,
              )),
        ),
      ),
    );
  }

  // product list
  Widget productList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.extent(
          maxCrossAxisExtent: 300,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
              productData1.length, (index) => productContainer(index: index))),
    );
  }

  Widget productContainer(
      {double? rightMargin, double? leftMargin, required int index}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/product', arguments: productData1[index]);
        productIndex = index;
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: GlassMorphism(
          blur: 30,
          opacity: 0.2,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: lightGreyProductBox,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  //color selector box
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        colorBox(lightGreenContainer, true),
                                        colorBox(skinContainer, false),
                                      ],
                                    ),
                                  ),

                                  // add to cart button
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  15)),
                                      child: const Text(
                                        '+ Add',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        //image and fav button
                        Expanded(
                            flex: 3,
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    //product image
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  15)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(10),
                                        child: Image.asset(
                                          productData1[index]['img'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    // favourite button
                                    Positioned(
                                      right: 8,
                                      top: 5,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            productData1[index]['favourite'] = !productData1[index]['favourite'];
                                          });
                                        },
                                        child: GlassMorphism(
                                            blur: 20,
                                            opacity: 0.2,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Icon(
                                                (!productData1[index]['favourite'])
                                                    ? Icons.favorite_border_outlined
                                                    : Icons.favorite,
                                                size: 16,
                                                color: (!productData1[index]['favourite'])
                                                  ? Colors.black
                                                  : Colors.red,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )),
              ),

              //product brand name and button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0, top: 8),
                          child: Row(
                            children: [
                              Text(
                                productData1[index]['brand'],
                                style: TextStyle(
                                    color: lightFontColor, fontSize: 10),
                              )
                            ],
                          ),
                        ),

                        //product name
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, bottom: 10, top: 0),
                          child: Row(
                            children: [
                              Text(
                                productData1[index]['name'],
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: Text(
                        '\$${productData1[index]['price']}',
                        style: const TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //color selector box
  Widget colorBox(Color color, bool selected) {
    return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(100),
          border: Border.all(
              color: selected ? color : const Color(0xfff7f7f7),
              width: selected ? 1.5 : 0)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusDirectional.circular(100),
        ),
      ),
    );
  }

  void navigateTo(String screenName) {
    Navigator.of(context).pushNamed(screenName);
  }
}
