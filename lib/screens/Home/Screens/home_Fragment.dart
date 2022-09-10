import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomart/screens/ProductDetail/product_detail.dart';
import 'package:gomart/screens/Search/search_results.dart';
import 'package:gomart/screens/notifications/notifications.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../styles/styles.dart';

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Styles.colorWhite,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Image.asset(
              'assets/icon/gomart-logo--with-text-home-screen.png',
              height: 34,
            ),
          ),
          leadingWidth: 200,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsScreen()),
                );
              },
              icon: const Icon(
                Gomart.notificationBell,
                color: Styles.colorTextDark,
                size: 25,
              ),
            )
          ],
        ),
        Container(
            color: Styles.colorWhite,
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*    Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.46,
                  decoration: BoxDecoration(
                      color: Styles.colorTextFieldBackground,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Search here',
                    style: TextStyle(
                        fontSize: 12, color: Styles.colorTextFieldHint),
                  ),
                ),*/
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: 30,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (text) {},
                    onSubmitted: (event) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SearchResults()));
                      if (kDebugMode) {
                        print('Search submitted');
                      }
                    },
                    style:
                        const TextStyle(fontSize: 12, color: Styles.colorBlack),
                    cursorColor: Styles.colorPrimary,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontSize: 12, color: Styles.colorTextFieldHint),
                      fillColor: Styles.colorTextFieldBackground,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8),
                      focusColor: Styles.colorWhite,
                      hoverColor: Styles.colorWhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search here',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.46,
                  decoration: BoxDecoration(
                      color: Styles.colorTextFieldBackground,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Where?',
                    style: TextStyle(
                        fontSize: 12, color: Styles.colorTextFieldHint),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
                floating: true, delegate: CustomPersistentHeader()),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: SampleProducts.listOfProducts.length,
                  (BuildContext context, int index) {
                return SampleProducts.listOfProducts[index];
              }),
            )
          ]),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productId;
  final String productName;
  final String? price;
  final String phoneNumber;
  final String address;
  final bool isOpen;
  final String closingTime;
  final String? openingAndClosingTime;
  final String productImageUrl;
  final String companyName;

  const ProductCard(
      {Key? key,
      required this.productName,
      this.price,
      required this.phoneNumber,
      required this.address,
      required this.isOpen,
      required this.closingTime,
      required this.productId,
      required this.productImageUrl,
      required this.companyName,
      this.openingAndClosingTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailScreen()),
        );
      },
      child: Container(
          color: Styles.colorWhite,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInImage(
                      width: MediaQuery.of(context).size.width * 0.36,
                      height: MediaQuery.of(context).size.width * 0.28,
                      placeholder: const AssetImage(
                          'assets/images/placeholder-image.png'),
                      image: NetworkImage(productImageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Row(
                      children: [
                        const Icon(
                          Gomart.locationIcon,
                          size: 16,
                        ),
                        Text(
                          address,
                          style: const TextStyle(
                              color: Styles.colorTextDark, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(color: Styles.colorBlack),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Text(
                      price ?? 'Contact us for price',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Styles.colorTextBlue,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Text(
                      companyName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Styles.colorTextDark),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    openingAndClosingTime != null
                        ? Row(
                            children: [
                              const Text('Hours: ',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Styles.colorTextDark,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                openingAndClosingTime ?? '',
                                style: const TextStyle(
                                    fontSize: 10, color: Styles.colorTextDark),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              const Text(
                                'Hours: ',
                                style: TextStyle(
                                    fontSize: 12, color: Styles.colorTextDark),
                              ),
                              Text(
                                isOpen ? 'Open' : 'Closed',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isOpen
                                        ? Styles.colorTextGreen
                                        : Styles.colorTextRed),
                              ),
                              Text(
                                isOpen
                                    ? ' - Closes $closingTime'
                                    : ' - Opens $closingTime',
                                style: const TextStyle(
                                    fontSize: 12, color: Styles.colorTextDark),
                              ),
                            ],
                          ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            phoneNumber,
                            style: const TextStyle(
                              color: Styles.colorTextBlue,
                              fontSize: 13,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          InkWell(
                            onTap: () async {
                              String url = "tel:$phoneNumber";
                              if (await canLaunchUrlString(url)) {
                                await launchUrlString("tel:$phoneNumber");
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Styles.colorSecondary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'Call',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Styles.colorBlack),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class SampleProducts {
  static List<ProductCard> listOfProducts = const [
    ProductCard(
      productId: '001',
      productName: 'Butter Cream Cake 6 Inches',
      price: 'N5,000',
      phoneNumber: '08078404049',
      address: 'Darmanawa, Kano',
      companyName: '3PLE F Bakers',
      isOpen: false,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Wholesale & Retail of Computers & Printing',
      phoneNumber: '08067397760',
      address: 'Wuse Zone 3, Abuja',
      companyName: 'Foretec Investment ',
      isOpen: true,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Auto Diagnosis',
      price: 'N6,000',
      phoneNumber: '07039113777',
      address: 'Life Camp, Abuja',
      companyName: 'Resure Auto Service ',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName:
          'Committed to bringing you fresh,  healthy and neat fruits & veggies',
      phoneNumber: '+234 802 212 4562',
      address: 'Asokoro, Abuja',
      companyName: 'Umar Fruit Market',
      openingAndClosingTime: 'Monday to Saturday 9am to 6pm',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Butter Cream Cake 6 Inches',
      price: 'N5,000',
      phoneNumber: '08078404049',
      address: 'Darmanawa, Kano',
      companyName: '3PLE F Bakers',
      isOpen: false,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Wholesale & Retail of Computers & Printing',
      phoneNumber: '08067397760',
      address: 'Wuse Zone 3, Abuja',
      companyName: 'Foretec Investment ',
      isOpen: true,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Auto Diagnosis',
      price: 'N6,000',
      phoneNumber: '07039113777',
      address: 'Life Camp, Abuja',
      companyName: 'Resure Auto Service ',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName:
          'Committed to bringing you fresh,  healthy and neat fruits & veggies',
      phoneNumber: '+234 802 212 4562',
      address: 'Asokoro, Abuja',
      companyName: 'Umar Fruit Market',
      openingAndClosingTime: 'Monday to Saturday 9am to 6pm',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Butter Cream Cake 6 Inches',
      price: 'N5,000',
      phoneNumber: '08078404049',
      address: 'Darmanawa, Kano',
      companyName: '3PLE F Bakers',
      isOpen: false,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Wholesale & Retail of Computers & Printing',
      phoneNumber: '08067397760',
      address: 'Wuse Zone 3, Abuja',
      companyName: 'Foretec Investment ',
      isOpen: true,
      closingTime: '10pm',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage6.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName: 'Auto Diagnosis',
      price: 'N6,000',
      phoneNumber: '07039113777',
      address: 'Life Camp, Abuja',
      companyName: 'Resure Auto Service ',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage1.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
    ProductCard(
      productId: '001',
      productName:
          'Committed to bringing you fresh,  healthy and neat fruits & veggies',
      phoneNumber: '+234 802 212 4562',
      address: 'Asokoro, Abuja',
      companyName: 'Umar Fruit Market',
      openingAndClosingTime: 'Monday to Saturday 9am to 6pm',
      isOpen: false,
      closingTime: '9am',
      productImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage2.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532',
    ),
  ];
}
