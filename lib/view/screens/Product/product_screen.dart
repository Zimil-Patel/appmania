import 'package:appmania/utils/colors/colors.dart';
import 'package:appmania/utils/lists/cart_list.dart';
import 'package:appmania/utils/users/user_data.dart';
import 'package:appmania/view/screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';
import '../../../utils/lists/product_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

//var productData;
late double width;
late double height;
late int productIndex;


class _ProductScreenState extends State<ProductScreen> {


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    //productData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: primaryColor,

      //appbar
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){

            Navigator.pop(context, "refresh");

          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        backgroundColor: Colors.white,
        actions: [
          //favourite button
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadiusDirectional.circular(100)),
            child: IconButton(
              onPressed: () {

                setState(() {
                  productData1[productIndex]['favourite'] = !productData1[productIndex]['favourite'];
                });

              },
              icon: Icon(
                (!productData1[productIndex]['favourite'])
                    ? Icons.favorite_border_outlined
                    : Icons.favorite,
                size: 20,
                color: (!productData1[productIndex]['favourite']) ? Colors.black : Colors.red,
              ),
            ),
          ),

          //share button
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadiusDirectional.circular(100)),
              child: IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.ios_share, size: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      //BODY OF THE SCREEN
      body: Column(
        children: [
          Expanded(
            child: ScrollShadowContainer(
              elevation: MaterialElevation.the4dp,
              child: Column(
                children: [
                  
                  //IMAGE CONTAINER
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                          color: Colors.white,
                      ),
                      child: Image.asset(productData1[productIndex]['img'], fit: BoxFit.cover,),
                                    ),
                  ),
                  const SizedBox(height: 10,),
                  
                  //DESCRIPTION OF PRODUCT
                  Container(
                    height: height / 2.2,
                    width: width,
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //PRODUCT NAME
                          Text(productData1[productIndex]['name'], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),

                          //RATING, REVIEW, LIKES, COMMENTS
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //RATING AND REVIEW
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(8),
                                    border: Border.all(color: Colors.grey.shade400)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.star, color: lightGreenContainer, size: 20,),
                                      Text(' ${productData1[productIndex]['rating']}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),),
                                      Text('  ${productData1[productIndex]['review']} reviews', style:  TextStyle(color: lightFontColor, fontWeight: FontWeight.w500, fontSize: 10),),
                                    ],
                                  ),
                                ),

                                //LIKES
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.circular(8),
                                      border: Border.all(color: Colors.grey.shade400)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.thumb_up, color: lightGreenContainer, size: 20,),
                                      Text(' ${productData1[productIndex]['like']}%', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),),
                                    ],
                                  ),
                                ),

                                //COMMENTS
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadiusDirectional.circular(8),
                                      border: Border.all(color: Colors.grey.shade400)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.question_answer_rounded, color: Colors.grey.shade400, size: 20,),
                                      Text('8', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //PRICE
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(14),
                                  color: primaryColor
                              ),
                              child: Row(
                                children: [
                                  Text(' \$${productData1[productIndex]['price']}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                  const SizedBox(width: 10),
                                  Text('from \$14 per month', style:  TextStyle(color: lightFontColor, fontWeight: FontWeight.w500, fontSize: 13),),
                                  const Spacer(),
                                  Icon(Icons.info_outline, color: Colors.grey.shade400, size: 24,),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(productData1[productIndex]['description']),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
                (productData1[productIndex]['inCart']) ? goToCartBtn() : addToCartBtn(),

                //ADDRESS OF DELIVERY
                const Spacer(),
                Text(
                  address,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ADD TO CART BUTTON
  Widget addToCartBtn() {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: lightGreenContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15))),
        onPressed: () {
          setState(() {
            productData1[productIndex]['inCart'] = true;
            productData1[productIndex]['quantity'] = 1;
            carList.add(productData1[productIndex]);
          });
        },
        child: Text(
          'Add to cart',
          style: TextStyle(
              color: fontColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //GO TO CART BUTTON
  Widget goToCartBtn() {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: lightGreenContainer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15))),
        onPressed: ()async {
            totalAmt = getTotal();
            String? refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));

            if(refresh == "refresh"){
              setState(() {

              });
            }

        },
        child: Text(
          'Go to cart',
          style: TextStyle(
              color: fontColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
