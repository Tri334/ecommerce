import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:ecommerce/model/data.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 55,
                      child: TextField(
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
                        CommerceIcons.filterE,
                        color: Color(0xFFC4D2DF),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                        children: discountCard.map<Widget>((diskon) {
                      return cardExample(diskon.discount);
                    }).toList()),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: searchColor.map<Widget>(
                      (sColor) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: sColor.color,
                            height: 95,
                            width: 95,
                            child: Icon(
                              sColor.icons,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container cardExample(diskon) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 315,
        height: 140,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 207, 206, 204).withOpacity(0.3),
              spreadRadius: 0.5,
              blurStyle: BlurStyle.normal,
              blurRadius: 9),
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              height: 85,
              width: 335,
              child: Stack(children: [
                const Image(
                  image: AssetImage('assets/image/discount.png'),
                  fit: BoxFit.contain,
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$diskon%',
                            style: const TextStyle(
                                fontSize: 55,
                                fontFamily: 'ProductSans',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0E2131)),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Text(
                              'off',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF1AB20)),
                            ),
                          ),
                        ],
                      ),
                      const Text('Discount Weekend Voucher')
                    ],
                  ),
                )
              ]),
            )));
  }
}
