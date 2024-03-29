import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gomart/screens/Home/Screens/Home/home.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:gomart/styles/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import '../Home/Screens/Messages/message.dart';
import 'fade_route.dart';
import 'image_preview_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final SampleProducts product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds before executing the code below
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Styles.colorWhite, // navigation bar color
          statusBarColor: Styles.colorWhite, // status bar color
          statusBarIconBrightness: Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icons' color
        ),
        child: loading
            ? const ProductDetailLoading()
            : ProductDetail(product: widget.product));
  }
}

class ProductDetailLoading extends StatelessWidget {
  const ProductDetailLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                      height: 114,
                      decoration: const BoxDecoration(
                        color: Styles.colorBackground,
                      )),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Styles.colorWhite.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: const BackButton(
                            color: Styles.colorGray,
                          )))
                ],
              ),
              Container(
                  color: Styles.colorWhite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Styles.colorGray.withOpacity(0.2)),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Container(
                        color: Styles.colorWhite,
                        width: MediaQuery.of(context).size.width * 0.762,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  color: Styles.colorBarBottomSheet,
                                ),
                                Container(
                                  height: 12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  color: Styles.colorBarBottomSheet,
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(4)),
                            Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              color: Styles.colorBarBottomSheet,
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Container(
                              height: 10,
                              width: MediaQuery.of(context).size.width * 0.2,
                              color: Styles.colorBarBottomSheet,
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: Styles.colorBarBottomSheet,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /*  const Text(
                                      '1,121 Followers',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Padding(padding: EdgeInsets.all(2)),*/
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 24),
                                      decoration: BoxDecoration(
                                        color: Styles.colorSecondary,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        '      ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Styles.colorBlack),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                          ],
                        ),
                      )
                    ],
                  )),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Styles.colorBackground,
                    ),
                    height: 291,
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.colorBarBottomSheet,
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                        onPressed: () {},
                        color: Styles.colorBarBottomSheet,
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.colorBarBottomSheet,
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                        onPressed: () {},
                        color: Styles.colorBarBottomSheet,
                        icon: const Icon(Icons.ios_share),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Styles.colorWhite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 12,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Styles.colorBarBottomSheet,
                        ),
                        Container(
                          height: 12,
                          width: MediaQuery.of(context).size.width * 0.15,
                          color: Styles.colorBarBottomSheet,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    const Padding(padding: EdgeInsets.all(4)),
                    Center(
                      child: Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.15,
                        color: Styles.colorBarBottomSheet,
                      ),
                    )
                  ],
                ),
              ),
              // const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final SampleProducts product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      bottomNavigationBar: const ProdutButtonNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Styles.colorBackground,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2Fbanner.png?alt=media&token=8274b345-e083-451a-9cdb-dbf1b15d9763'),
                            fit: BoxFit.cover)),
                    height: 114,
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Styles.colorBlack.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(50)),
                          child: const BackButton(
                            color: Styles.colorWhite,
                          )))
                ],
              ),
              Container(
                  color: Styles.colorWhite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FbusinessLogo.png?alt=media&token=128b8d3c-ce25-4a78-b769-fa92c3d6c014'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(60),
                            color: Styles.colorGray),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Container(
                        color: Styles.colorWhite,
                        width: MediaQuery.of(context).size.width * 0.762,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.companyName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.star,
                                            size: 15,
                                            color: Styles.colorSecondary),
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.all(1)),
                                    const Text(
                                      '(52 Reviews)',
                                      style: TextStyle(
                                          color: Styles.colorPrimary,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(4)),
                            const Text(
                              'No. 885 Darmanawa Tudun Fulani',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            const Text(
                              'Darmanawa, Kano',
                              style: TextStyle(
                                  fontSize: 13, color: Styles.colorPrimary),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Hours: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Styles.colorTextDark),
                                        ),
                                        Text(
                                          true ? 'Open' : 'Closed',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: true //product.isOpen
                                                  ? Styles.colorTextGreen
                                                  : Styles.colorTextRed),
                                        ),
                                        Text(
                                          true // product.isOpen
                                              ? ' - Closes 5pm'
                                              : ' - Opens 5pm',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Styles.colorTextDark),
                                        ),
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.all(2)),
                                    const Text(
                                      'Members since August 2022',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Styles.colorGray),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /*  const Text(
                                      '1,121 Followers',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Padding(padding: EdgeInsets.all(2)),*/
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 24),
                                      decoration: BoxDecoration(
                                        color: Styles.colorSecondary,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'Follow',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Styles.colorBlack),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                          ],
                        ),
                      )
                    ],
                  )),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadeRoute(
                          page: ImagePreview(
                            imageUrl:
                                'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FcakeProduct.png?alt=media&token=21352a2f-4116-4c74-affa-2b063447ac96',
                            heroTag: UniqueKey().toString(),
                            productName: 'product.productName',
                            productUrl: 'product.productUrl',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.colorBackground,
                          image: DecorationImage(
                              image: NetworkImage(product.productImageUrl),
                              fit: BoxFit.cover)),
                      height: 291,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.colorGray.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                        onPressed: () {},
                        color: Styles.colorWhite,
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.colorGray.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(40)),
                      child: IconButton(
                        onPressed: () {},
                        color: Styles.colorWhite,
                        icon: const Icon(Icons.ios_share),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Styles.colorWhite,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            product.productName,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Text(
                          'N5,000',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Styles.colorPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    const Text(
                        'Our 6" classic vanilla sponge cake boasts three layers of strawberry jam & vanilla buttercream filling with a perfectly smooth buttercream exterior, showered with...'),
                    const Padding(padding: EdgeInsets.all(4)),
                    const Center(
                        child: Text(
                      'Read more',
                      style: TextStyle(
                        color: Styles.colorPrimary,
                      ),
                    ))
                  ],
                ),
              ),
              const MapSample(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: Styles.colorBackground,
                child: Row(
                  children: [
                    const Icon(
                      Gomart.locationIcon,
                      size: 16,
                    ),
                    /*Text(
                      'Darmanawa, Kano  -  1.6 kilometers',
                      style: TextStyle(fontSize: 14),
                    ),*/
                    Row(
                      children: [
                        const Text(
                          'Darmanawa, Kano  - ',
                          style: TextStyle(fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print("View distance");
                            }
                          },
                          child: const Text(
                            'View distance',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Styles.colorPrimary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  color: Styles.colorWhite,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Styles.colorBackground,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            'Search all 29 items',
                            style: TextStyle(
                                fontSize: 12, color: Styles.colorTextLightGrey),
                          )),
                      const Padding(padding: EdgeInsets.all(8)),
                      const ProductDetailItem(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2Fproduct1.png?alt=media&token=10cb319c-9d42-46c9-916c-c124ec190920',
                        productTitle:
                            'Fill Your Own Box of 12 Cupcakes I Mix & Match Your Favorite Flavours',
                        price: 'N8,000',
                      ),
                      const ProductDetailItem(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2Fproduct2.png?alt=media&token=c1a89179-590e-4d51-aedd-003623274e0d',
                        productTitle:
                            'Fill Your Own Box of 12 Cupcakes I Mix & Match Your Favorite Flavours',
                        price: 'N6,000',
                      ),
                      const ProductDetailItem(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2Fproduct3.png?alt=media&token=2456b3a9-ab98-48a5-8b6c-912221842e09',
                        productTitle:
                            'Simple 6 inch cake covered with a simple boarder of pretty fondant',
                        price: 'N9,500',
                      ),
                      const ProductDetailItemSmall(
                        productTitle: 'Chocolate cake with mint custard',
                        price: 'N9,500',
                      ),
                      const ProductDetailItemSmall(
                        productTitle:
                            '6, 8 and 10 inch cake covered with a simple boarder of pretty fondant',
                        price: 'N12,000',
                      ),
                      const Center(
                          child: Text(
                        'View all',
                        style: TextStyle(
                          color: Styles.colorPrimary,
                        ),
                      ))
                    ],
                  )),
              const Padding(padding: EdgeInsets.all(4)),
              Container(
                color: Styles.colorWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'View our gallery',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Styles.colorPrimary,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Wrap(
                            spacing: 2,
                            runSpacing: 2,
                            children: const [
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService1.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService2.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService3.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService4.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService4.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                              GallaryImageItem(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FautoService4.png?alt=media&token=c60abe64-f53a-4fbb-b123-bf854329839f'),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: MediaQuery.of(context).size.width * 0.43,
                          child: Center(
                              child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Styles.colorPrimary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              'View more',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Styles.colorWhite),
                            ),
                          )),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Container(
                color: Styles.colorWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductCardSponsored(
                        product: SampleProducts.listOfProducts[0]),
                    ProductCardSponsored(
                        product: SampleProducts.listOfProducts[1]),
                    const HomeAdMobBanner(bannerSize: AdSize.fullBanner),
                    ProductCardSponsored(
                        product: SampleProducts.listOfProducts[2]),
                  ],
                ),
              ),
              // const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailItemSmall extends StatelessWidget {
  final String productTitle;
  final String price;

  const ProductDetailItemSmall({
    Key? key,
    required this.productTitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/placeholder-image.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                //color: Styles.colorBackground,
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(productTitle)),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(
                    price,
                    style: const TextStyle(color: Styles.colorPrimary),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

class ProductDetailItem extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String price;

  const ProductDetailItem({
    Key? key,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                // color: Styles.colorBackground,
              ),
              const Padding(padding: EdgeInsets.all(8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(productTitle)),
                  Text(
                    price,
                    style: const TextStyle(color: Styles.colorPrimary),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}

class GallaryImageItem extends StatelessWidget {
  final String imageUrl;

  const GallaryImageItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          FadeRoute(
            page: ImagePreview(
              imageUrl: imageUrl,
              heroTag: UniqueKey().toString(),
              productName: 'product.productName',
              productUrl: 'product.productUrl',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Styles.colorBackground,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        width: MediaQuery.of(context).size.width * 0.32,
        height: MediaQuery.of(context).size.width * 0.32,
      ),
    );
  }
}

class PhotoViewer extends StatelessWidget {
  final String imageUrl;

  const PhotoViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(imageUrl),
    );
  }
}

class ProdutButtonNav extends StatelessWidget {
  const ProdutButtonNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Styles.colorPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Styles.colorSecondary,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: const Text(
              'Call',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Styles.colorBlack),
            ),
          ),
          const ChatButton(),
        ],
      ),
    );
  }
}

class ChatButton extends StatefulWidget {
  const ChatButton({super.key});

  @override
  State<StatefulWidget> createState() => ChatButtonState();
}

class ChatButtonState extends State<ChatButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Styles.colorSecondary,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 70),
        shape: const StadiumBorder(),
      ),
/*      onPressed: () async {
        final otherUser = User(
          id: 'OTHER_USER_ID',
          extraData: const {
            'name': 'OTHER_USER_NAME',
          },
        );
        final client = StreamChat.of(context).client;
        final channel = client.channel(
          'messaging',
          extraData: {
            'members': [otherUser.id, client.state.user!.id],
          },
        );

        await channel.watch();

        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StreamChat(
              client: client,
              child: ChannelPage(
                channel: channel,
              ),
            ),
          ),
        );

        if (result != null) {
          await channel.sendMessage(Message(
            text: result,
            user: client.state.user!,
          ));
        }
      },*/
      onPressed: () async {
        final client = StreamChat.of(context).client;
        final channel = client.channel(
          'messaging',
          id: 'reSureAutoServiceId',
          extraData: {
            'name': 'Resure Auto Service',
            'members': [ 'msjahun'],
          },
        );

       await channel.watch();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StreamChannel(
                channel: channel,
                child: const ChannelPage(),
              );
            },
          ),
        );
      },
      child: const Text(
        'Chat',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Styles.colorBlack),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  Circle circles = Circle(
    circleId: CircleId('circle_id_${DateTime.now().millisecondsSinceEpoch}'),
    center: const LatLng(12.0037545, 8.5327996),
    fillColor: const Color(0xffCADDE8).withOpacity(0.54),
    strokeColor: const Color(0xff66B8CA),
    strokeWidth: 2,
    radius: 180,
  );
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.0037545, 8.5327996),
    zoom: 15.2,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        circles: {circles},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
