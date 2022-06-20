import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:ecommerce/mainPage/clothes_info.dart';
import 'package:ecommerce/mainPage/search_page.dart';
import 'package:ecommerce/model/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    userImage(),
                    searchIcons(context),
                    const ListOfClothes(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontFamily: 'ProductSans',
                                color: Color(0xFF0E2131),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Text(
                            'Show All',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'ProductSans',
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffF1AB20)),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: recommendedClothes.map<Widget>(
                          (e) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffE6EDF4)),
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image(
                                                image: AssetImage(e.urlImage))),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 12)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50, top: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '\$${e.price.toStringAsFixed(2)}',
                                                        style: const TextStyle(
                                                            height: 1.25,
                                                            fontFamily:
                                                                'ProductSans',
                                                            color: Color(
                                                                0xff0E2131),
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            fontSize: 17)),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                          '\$${e.discount.toStringAsFixed(2)}',
                                                          style: const TextStyle(
                                                              height: 1.25,
                                                              fontFamily:
                                                                  'ProductSans',
                                                              color: Color(
                                                                  0xffFF6F6F),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200,
                                                              fontSize: 12,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic)),
                                                    )
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            customButtomBar()
          ],
        ),
      ),
    );
  }

  Padding searchIcons(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            SizedBox(
              width: 250,
              height: 55,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) {
                    return const SearchPage();
                  }));
                },
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xFFE6EDF4),
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFFC4D2DF),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 55,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) {
                      return const SearchPage();
                    }));
                  },
                  child: Container(
                    color: Colors.transparent,
                  )),
            ),
          ]),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFE6EDF4),
              ),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Color(0xFFC4D2DF),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Row userImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello User,',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Welcome Back!!',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 15,
                  color: Color(0xFF75828E)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
                height: 55,
                width: 55,
                child: Image.asset('assets/image/user_icon.png')),
          ),
        ),
      ],
    );
  }

  Positioned customButtomBar() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 207, 206, 204).withOpacity(0.3),
                spreadRadius: 0.5,
                blurStyle: BlurStyle.normal,
                blurRadius: 9),
          ]),
          height: 85,
          width: 335,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              height: 85,
              width: 335,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CommerceIcons.homeE,
                      color: Color(0xFFF1AB20),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CommerceIcons.heartE,
                      color: Color(0xFF798D9C),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.call_to_action_outlined,
                      color: Color(0xFF798D9C),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CommerceIcons.userE,
                      color: Color(0xFF798D9C),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfClothes extends StatelessWidget {
  const ListOfClothes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool like = false;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: listClothes.map<Widget>((clothes) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 260,
              width: 210,
              child: Stack(children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(colors: [
                      const Color(0xFFF2F3F5).withOpacity(0.7),
                      const Color(0xFFE6E7E9).withOpacity(0.7),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                        .createShader(
                            Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 260,
                      width: 210,
                      color: const Color(0xFFE6E7E9),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 210,
                          child: Image(
                            image: AssetImage(clothes.urlImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$${clothes.price}',
                                    style: const TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 20,
                                        color: Color(0xff0E2131),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    clothes.setName,
                                    style: const TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontWeight: FontWeight.w100,
                                        color: Color(0xFF75828E)),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xffF1AB20)
                                                .withOpacity(0.3),
                                            spreadRadius: 0.2,
                                            blurStyle: BlurStyle.normal,
                                            blurRadius: 9),
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ClothesInfo(clothes: clothes);
                                        }));
                                      },
                                      child: Hero(
                                        tag: clothes.setName,
                                        child: Container(
                                          color: const Color(0xffF1AB20),
                                          child: const Center(
                                            child: Text(
                                              'Buy',
                                              style: TextStyle(
                                                  fontFamily: 'ProductSans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 50,
                      child: Icon(
                        CommerceIcons.heartE,
                        color: (like == false)
                            ? const Color(0xffF1AB20)
                            : Colors.red,
                      ),
                    ),
                  ),
                )
              ]),
            );
            ;
          }).toList(),
        ));
  }
}
