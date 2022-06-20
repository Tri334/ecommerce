import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:ecommerce/mainPage/home_page.dart';
import 'package:ecommerce/model/data.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double shipping = 12.99;
    double final_price = 0.00;
    double total_price = 0.00;
    setState(() {
      for (var element in recommendedClothes) {
        total_price += element.price;
      }
      final_price = shipping + total_price;
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.amber,
                  child: backCart(context),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  // color: Colors.red,
                  child: listOfCart(),
                )),
            Expanded(
              flex: 3,
              child: Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          // color: Colors.amber,
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: Color(0xffE6EDF4),
                            ),
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xffE6EDF4),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Subtotal'),
                                      Text(
                                          '\$${total_price.toStringAsFixed(2)}')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Shipping'),
                                      Text('\$${shipping.toStringAsFixed(2)}')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Container(
                          // color: Colors.blueAccent,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total'),
                                    Text('\$${final_price.toStringAsFixed(2)}')
                                  ]),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF1AB20),
                          borderRadius: BorderRadius.circular(15)),
                      height: 55,
                      width: 315,
                      child: const Center(
                          child: Text(
                        'Checkout Now',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView listOfCart() {
    return SingleChildScrollView(
        child: Column(
      children: recommendedClothes.map<Widget>(
        (e) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE6EDF4)),
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(15)),
              width: 315,
              height: 100,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(image: AssetImage(e.urlImage))),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: const TextStyle(
                                  fontFamily: 'ProductSans',
                                  color: Color(0xff0E2131),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text(e.type,
                                style: const TextStyle(
                                    height: 1.25,
                                    fontFamily: 'ProductSans',
                                    color: Color(0xff75828E),
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 5),
                              child: Row(
                                children: [
                                  Text('\$${e.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          height: 1.25,
                                          fontFamily: 'ProductSans',
                                          color: Color(0xff0E2131),
                                          fontWeight: FontWeight.w200,
                                          fontSize: 17)),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text(
                                        'x1',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ).toList(),
    ));
  }

  Row backCart(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE6EDF4),
              ),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFC4D2DF),
                  size: 20,
                ))),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 4.5),
          child: const Text(
            'Cart',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'ProductSans',
                color: Color(0xff0E2131)),
          ),
        ),
      ],
    );
  }
}
