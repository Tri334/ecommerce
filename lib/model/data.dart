import 'package:ecommerce/icons/commerce_icons.dart';
import 'package:flutter/cupertino.dart';

class Discount {
  int discount;
  Discount({required this.discount});
}

class SearchColor {
  Color color;
  var icons;
  SearchColor({required this.color, required this.icons});
}

class ListClothes {
  String urlImage, setName, desc;
  double price;
  List<String> childImages, size;

  ListClothes(
      {required this.price,
      required this.setName,
      required this.urlImage,
      required this.childImages,
      required this.desc,
      required this.size});
}

class RecommendedClothes {
  String urlImage, name, type, desc;
  double price, discount;
  List<String> childImages, size;

  RecommendedClothes(
      {required this.price,
      required this.discount,
      required this.name,
      required this.type,
      required this.urlImage,
      required this.childImages,
      required this.desc,
      required this.size});
}

var discountCard = [
  Discount(discount: 14),
  Discount(discount: 20),
  Discount(discount: 2),
  Discount(discount: 15),
  Discount(discount: 99),
];

var searchColor = [
  SearchColor(color: const Color(0xFFFF9660), icons: CommerceIcons.gemE),
  SearchColor(color: const Color(0xFF957EF2), icons: CommerceIcons.keyboardE),
  SearchColor(color: const Color(0xFF66C4EE), icons: CommerceIcons.sportE),
  SearchColor(color: const Color(0xFFFFCF54), icons: CommerceIcons.hangerE),
  SearchColor(
      color: const Color(0xFFFF95EE), icons: CommerceIcons.gear_settingE),
  SearchColor(color: const Color(0xFFA0D361), icons: CommerceIcons.tri_dotsE),
];

var listClothes = [
  ListClothes(
      price: 20.50,
      setName: 'Weekend Set',
      urlImage: 'assets/image/weekend_set.png',
      childImages: [
        'assets/image/weekend_set.png',
        'assets/image/weekend_set1.png',
        'assets/image/weekend_set2.png',
        'assets/image/weekend_set3.png',
      ],
      desc: 'Set Weekend yang sangat nyaman dipakai di hari libur.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  ListClothes(
      price: 99.99,
      setName: 'Monday Set',
      urlImage: 'assets/image/straus_style.png',
      childImages: [
        'assets/image/straus_style.png',
        'assets/image/weekend_set1.png',
        'assets/image/weekend_set2.png',
        'assets/image/weekend_set3.png',
      ],
      desc: 'Hari senin? Pakailah set ini agar harimu selalu senin.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  ListClothes(
      price: 100,
      setName: 'Thursday Set',
      urlImage: 'assets/image/weekend_set.png',
      childImages: [
        'assets/image/weekend_set.png',
        'assets/image/weekend_set1.png',
        'assets/image/weekend_set2.png',
        'assets/image/weekend_set3.png',
      ],
      desc: 'Adedeh set buat hari kejepit... Pasti buat nyaman!',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  ListClothes(
      price: 85.50,
      setName: 'Guest Set',
      urlImage: 'assets/image/straus_style.png',
      childImages: [
        'assets/image/straus_style.png',
        'assets/image/weekend_set1.png',
        'assets/image/weekend_set2.png',
        'assets/image/weekend_set3.png',
      ],
      desc: 'Tamu mintanya aneh aneh ga? Jika iya, pakai set yang satu ini!',
      size: ['XS', 'S', 'M', 'L', 'XL']),
];

var recommendedClothes = [
  RecommendedClothes(
      price: 22.50,
      discount: 9.00,
      type: 'Combad 24s',
      name: 'White T-Shirt',
      urlImage: 'assets/image/recomended1.png',
      childImages: [
        'assets/image/recomended1.png',
        'assets/image/recomended2.png'
      ],
      desc: 'T-Shirt canggih bisa combat 24s.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  RecommendedClothes(
      price: 59.50,
      discount: 100.00,
      type: 'Combad 24s',
      name: 'Hoodie White',
      urlImage: 'assets/image/recomended2.png',
      childImages: [
        'assets/image/recomended2.png',
        'assets/image/recomended1.png'
      ],
      desc: 'Sama saja tapi jenis hoodie.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  RecommendedClothes(
      price: 22.50,
      discount: 90.00,
      type: 'Combad 24s',
      name: 'White T-Shirt',
      urlImage: 'assets/image/recomended1.png',
      childImages: [
        'assets/image/recomended1.png',
        'assets/image/recomended2.png'
      ],
      desc: 'T-Shirt canggih bisa combat 24s.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
  RecommendedClothes(
      price: 59.50,
      discount: 10.00,
      type: 'Combad 24s',
      name: 'Hoodie White',
      urlImage: 'assets/image/recomended2.png',
      childImages: [
        'assets/image/recomended2.png',
        'assets/image/recomended1.png'
      ],
      desc: 'Sama saja tapi jenis hoodie.',
      size: ['XS', 'S', 'M', 'L', 'XL']),
];
