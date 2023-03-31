import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/data/model/Product/product_model.dart';
import 'package:gomart/screens/Home/Screens/Home/bloc/bloc.dart';
import 'package:gomart/screens/Home/Screens/Home/bloc/bloc.dart';
import 'package:gomart/screens/ProductDetail/product_detail.dart';
import 'package:gomart/screens/Search/search_input.dart';
import 'package:gomart/screens/Search/search_results.dart';
import 'package:gomart/screens/notifications/notifications.dart';
import 'package:gomart/shared_components/fade_in_page_route.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../styles/styles.dart';

class StateAndCities {
  static List<String> states = [
    'Abuja FCT',
    'Kano',
    'Kaduna',
  ];
  static List<String> cities = ['Wuse Zone 1 - Abuja', 'Gwarinpa', 'Darmanawa'];
}

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
                GestureDetector(
                  onTap: () {
                    //
                    Navigator.of(context)
                        .push(CustomPageRoute(const SearchInputScreen()));
                  },
                  child: Container(
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
                  ),
                ),
                /*SizedBox(
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
                ),*/
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: 'barrier text',
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (bc, ania, anis) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(padding: EdgeInsets.all(8)),
                                  const Text(
                                    'Choose your location',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  TextFieldDropdown(
                                    options: StateAndCities.states,
                                    currentSelectedValue:
                                        StateAndCities.states[0],
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  TextFieldDropdown(
                                    options: StateAndCities.cities,
                                    currentSelectedValue:
                                        StateAndCities.cities[0],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              Styles.colorBackground,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Styles.colorBlack),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              Styles.colorSecondary,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 30),
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Apply',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Styles.colorBlack),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
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

class TextFieldDropdown extends StatefulWidget {
  final String currentSelectedValue;
  final List<String> options;

  const TextFieldDropdown({
    Key? key,
    required this.currentSelectedValue,
    required this.options,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateTextFieldDropdown();
}

class StateTextFieldDropdown extends State<TextFieldDropdown> {
  late String _currentSelectedValue;

  @override
  void initState() {
    _currentSelectedValue = widget.currentSelectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                errorStyle:
                    const TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: 'Please select expense',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                fillColor: Styles.colorHomeDropdownFill,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Styles.colorHomeDropdownBorder, width: 0.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                )),
            isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Transform.rotate(
                    angle: 270 * pi / 180,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                    )),
                value: _currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    _currentSelectedValue = newValue!;
                    state.didChange(newValue);
                  });
                },
                items: widget.options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorBackground,
      child: Scaffold(
        backgroundColor: Styles.colorBackground,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: CustomScrollView(slivers: [
              SliverPersistentHeader(
                  floating: true, delegate: CustomPersistentHeader()),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.loadInProgress) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(childCount: 3,
                          (BuildContext context, int index) {
                        return const ProductCardLoading();
                      }),
                    );
                  } else if (state.loadSuccess) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.homeProducts?.length,
                          (BuildContext context, int index) {
                        return ProductCard(
                          product: SampleProducts.toProductModel(
                            state.homeProducts![index],
                          ),
                        );
                      }),
                    );
                  } else {
                    return SliverList(
                        delegate: SliverChildListDelegate([
                      const Center(
                        child: Text('Error encountered loading products'),
                      ),
                    ]));
                  }
                },
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                const HomeAdMobBanner(),
              ]))
            ]),
          ),
        ),
      ),
    );
  }
}

class HomeAdMobBanner extends StatefulWidget {
  final AdSize? bannerSize;

  const HomeAdMobBanner({Key? key, this.bannerSize}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateHomeAdMobBanner();
}

class StateHomeAdMobBanner extends State<HomeAdMobBanner> {
  late BannerAd myBanner;

  @override
  void initState() {
    myBanner = BannerAd(
      // adUnitId: Platform.isIOS?'	ca-app-pub-3940256099942544/6300978111':'ca-app-pub-5077686252014732/7090600180',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: widget.bannerSize != null
          ? widget.bannerSize as AdSize
          : AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
    myBanner.load();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: AdWidget(ad: myBanner),
    );
  }
}

class TestingChat {}

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
          color: Styles.colorSkeletalBackground,
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      height: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Styles.colorBarBottomSheet,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Row(
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          color: Styles.colorBarBottomSheet,
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Container(
                          height: 8,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Styles.colorBarBottomSheet,
                        )
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
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      height: 8,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Container(
                      height: 14,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Styles.colorBarBottomSheet,
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: MediaQuery.of(context).size.width * 0.1,
                          color: Styles.colorBarBottomSheet,
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Container(
                          height: 8,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Styles.colorBarBottomSheet,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 8,
                            width: MediaQuery.of(context).size.width * 0.2,
                            color: Styles.colorBarBottomSheet,
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          Container(
                            height: 20,
                            width: 50,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Styles.colorSecondary,
                              borderRadius: BorderRadius.circular(16),
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

class ProductCard extends StatelessWidget {
  final SampleProducts product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                    product: product,
                  )),
        );
      },
      child: Container(
          color: Styles.colorWhite,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
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
                          image: NetworkImage(product.productImageUrl),
                          fit: BoxFit.fitWidth,
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
                          product.productName,
                          style: const TextStyle(color: Styles.colorBlack),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Text(
                          product.price ?? 'Contact us for price',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Styles.colorTextBlue,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(
                          product.companyName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Styles.colorTextDark),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        product.openingAndClosingTime != null
                            ? Row(
                                children: [
                                  const Text('Hours: ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Styles.colorTextDark,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    product.openingAndClosingTime ?? '',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Styles.colorTextDark),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  const Text(
                                    'Hours: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Styles.colorTextDark),
                                  ),
                                  Text(
                                    product.isOpen ? 'Open' : 'Closed',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: product.isOpen
                                            ? Styles.colorTextGreen
                                            : Styles.colorTextRed),
                                  ),
                                  Text(
                                    product.isOpen
                                        ? ' - Closes ${product.closingTime}'
                                        : ' - Opens ${product.closingTime}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Styles.colorTextDark),
                                  ),
                                ],
                              ),
                        const Padding(padding: EdgeInsets.all(8)),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Row(
                        children: [
                          const Icon(
                            Gomart.locationIcon,
                            size: 16,
                          ),
                          Text(
                            product.address,
                            style: const TextStyle(
                                color: Styles.colorTextDark, fontSize: 12),
                          ),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.phoneNumber,
                            style: const TextStyle(
                              color: Styles.colorTextBlue,
                              fontSize: 13,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          InkWell(
                            onTap: () async {
                              String url = "tel:${product.phoneNumber}";
                              if (await canLaunchUrlString(url)) {
                                await launchUrlString(
                                    "tel:${product.phoneNumber}");
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
                  )
                ],
              )
            ],
          )),
    );
  }
}

class ProductCardSponsored extends StatelessWidget {
  final SampleProducts product;

  const ProductCardSponsored({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
          color: Styles.colorWhite,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
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
                          image: NetworkImage(product.productImageUrl),
                          fit: BoxFit.fitWidth,
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
                          product.productName,
                          style: const TextStyle(color: Styles.colorBlack),
                        ),
                        const Padding(padding: EdgeInsets.all(2)),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Styles.colorPrimary, spreadRadius: 1),
                            ],
                          ),
                          child: const Text(
                            'Sponsored',
                            style: TextStyle(
                              color: Styles.colorPrimary,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Text(
                          product.price ?? 'Contact us for price',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Styles.colorTextBlue,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(
                          product.companyName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Styles.colorTextDark),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        product.openingAndClosingTime != null
                            ? Row(
                                children: [
                                  const Text('Hours: ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Styles.colorTextDark,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                    product.openingAndClosingTime ?? '',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Styles.colorTextDark),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  const Text(
                                    'Hours: ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Styles.colorTextDark),
                                  ),
                                  Text(
                                    product.isOpen ? 'Open' : 'Closed',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: product.isOpen
                                            ? Styles.colorTextGreen
                                            : Styles.colorTextRed),
                                  ),
                                  Text(
                                    product.isOpen
                                        ? ' - Closes ${product.closingTime}'
                                        : ' - Opens ${product.closingTime}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Styles.colorTextDark),
                                  ),
                                ],
                              ),
                        const Padding(padding: EdgeInsets.all(2)),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Row(
                        children: [
                          const Icon(
                            Gomart.locationIcon,
                            size: 16,
                          ),
                          Text(
                            product.address,
                            style: const TextStyle(
                                color: Styles.colorTextDark, fontSize: 12),
                          ),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.phoneNumber,
                            style: const TextStyle(
                              color: Styles.colorTextBlue,
                              fontSize: 13,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          InkWell(
                            onTap: () async {
                              String url = "tel:${product.phoneNumber}";
                              if (await canLaunchUrlString(url)) {
                                await launchUrlString(
                                    "tel:${product.phoneNumber}");
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
                  )
                ],
              )
            ],
          )),
    );
  }
}

class SampleProducts {
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

  const SampleProducts(
      {required this.productName,
      this.price,
      required this.phoneNumber,
      required this.address,
      required this.isOpen,
      required this.closingTime,
      required this.productId,
      required this.productImageUrl,
      required this.companyName,
      this.openingAndClosingTime});

  static SampleProducts toProductModel(ProductModel product) {
    return SampleProducts(
        productId: product.id ?? 'null',
        productName: product.productName ?? 'null',
        price: product.price,
        phoneNumber: product.phoneNumber ?? 'null',
        address: product.address ?? 'null',
        companyName: product.companyName ?? 'null',
        isOpen: false,
        closingTime: product.closingTime ?? 'null',
        productImageUrl: product.productImageUrl ?? 'null');
  }

  static List<SampleProducts> listOfProducts = const [
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
    SampleProducts(
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
