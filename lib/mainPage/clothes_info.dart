import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:ecommerce/mainPage/cart.dart';
import 'package:ecommerce/model/data.dart';
import 'package:flutter/material.dart';

class ClothesInfo extends StatefulWidget {
  final ListClothes clothes;
  const ClothesInfo({Key? key, required this.clothes}) : super(key: key);

  @override
  State<ClothesInfo> createState() => _HeroClothesState();
}

List<Widget> sizeClothesX = [];

class _HeroClothesState extends State<ClothesInfo> {
  String onSelectSize = '';
  int count = 0;
  String pickImage = '';

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (count <= 0) {
        count = 0;
      }
      if (pickImage == '') {
        pickImage = widget.clothes.urlImage;
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      children: [
                        imageSet(context, widget.clothes),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                            child: Column(
                              children: [
                                clothesSet(),
                                sizeWidget(onSelectSize),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    widget.clothes.desc,
                                    style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              left: 30,
              bottom: 20,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Cart();
                              },
                            ));
                          },
                          icon: Icon(
                            CommerceIcons.cartE,
                            color: Color(0xFFC4D2DF),
                            size: 20,
                          ))),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 245,
                      height: 55,
                      color: Color(0xFFF1AB20),
                      child: Center(
                        child: Text(
                          'Buy Now - \$${widget.clothes.price}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row clothesSet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.clothes.setName,
                style: const TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '\$${widget.clothes.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffF1AB20),
                    height: 2),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.only(left: 2, right: 2),
              width: 90,
              height: 40,
              color: const Color(0xffF1F3F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count -= 1;
                      });
                    },
                    icon: const Icon(Icons.arrow_downward_rounded),
                    color: const Color(0xffB1BDC9),
                  ),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        count += 1;
                      });
                    },
                    icon: const Icon(Icons.arrow_upward_rounded),
                    color: const Color(0xffB1BDC9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Expanded imageSet(context, clothes) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HeroChild(clothes: pickImage);
              }));
            },
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Hero(
                    tag: pickImage,
                    child: Image(
                      image: AssetImage(pickImage == ''
                          ? widget.clothes.urlImage
                          : pickImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.clothes.childImages.map(
                (e) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              pickImage = e;
                            });
                          },
                          child: Image(
                            image: AssetImage(e),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ));
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }

  Padding sizeWidget(onSelectSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.clothes.size.map((sizes) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onSelectSize = sizes.toLowerCase();
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: onSelectSize == sizes
                        ? Color(0xffF1AB20)
                        : Color(0xffE6EDF4),
                    child: Center(
                      child: Text(
                        sizes,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'ProductSans'),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class HeroChild extends StatelessWidget {
  final String clothes;
  const HeroChild({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(color: Colors.transparent),
            ),
          ),
          Center(
            child: Hero(
              tag: '$clothes',
              child: Image.asset(clothes),
            ),
          ),
        ]),
      ),
    );
  }
}
