import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/lists/image_list.dart';
import 'package:appmania/utils/users/user_data.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Column(
      children: [
        //custom app/top bar
        customAppBar(),

        //center bar
        centerBar(),

        //partition bar
        paritionLine(),

        Expanded(
            child: ScrollShadowContainer(
                elevation: MaterialElevation.the2dp,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //OFFER BANNER AND FAVOURITES
                      offerAndFavouriteBox(),

                      paritionLine(),

                      //popular brand list
                      brandBox()
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
                            color: lightFontColor, fontWeight: FontWeight.w500),
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
                      color: lightFontColor, fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.filter_alt_outlined),
              ],
            ),
          ),
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
        height: height / 4.5,
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
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Favourites',
                            style: TextStyle(
                                fontSize: 16,
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

  //brands Text
  Widget brandText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text('Poluplar Brands',
          style: GoogleFonts.exo2(
            textStyle: TextStyle(
                color: fontColor, fontSize: 20, fontWeight: FontWeight.w700),
          )),
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
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: brandText()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: lightFontColor,
                          fontWeight: FontWeight.w700,
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
            color: lightFontColor,
            boxShadow: [
              BoxShadow(blurRadius: 15, spreadRadius: 5, color: primaryColor)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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

  void navigateTo(String screenName) {
    Navigator.of(context).pushNamed(screenName);
  }
}
