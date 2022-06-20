import 'dart:ui';

import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:ecommerce/mainPage/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage('assets/image/landing_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 1.7,
            child: Opacity(
              opacity: 0.8,
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)
                      .createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                },
                blendMode: BlendMode.dstOut,
                child: SizedBox(
                  height: 300,
                  child: Container(color: Colors.black),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                'Pick Your Favourite Clothes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  wordSpacing: 1,
                  fontFamily: 'PlusJakarta',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 55,
                    width: 315,
                    color: const Color(0xFFF1AB20),
                    child: const Center(
                      child: Text(
                        'Checkout Now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProductSans'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
