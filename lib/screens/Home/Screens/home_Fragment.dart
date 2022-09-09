import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomart/styles/custom_home_icons.dart';

import '../../../styles/styles.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Styles.colorWhite,
              padding: const EdgeInsets.fromLTRB(12, 12, 4, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon/gomart-logo--with-text-home-screen.png',
                    height: 34,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Gomart.notificationBell,
                      color: Styles.colorTextDark,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Container(
                color: Styles.colorWhite,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
            const ProductsListSection(),
          ],
        ),
      )),
    );
  }
}

class ProductsListSection extends StatelessWidget {
  const ProductsListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProductCard(),
        ProductCard(),
        ProductCard(),
        ProductCard(),
        ProductCard(),
        ProductCard(),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.36,
                    height: MediaQuery.of(context).size.width * 0.28,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/products-picture-sample%2Fimage3.png?alt=media&token=283e2392-5149-4a7b-a490-14bef689b532'))),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: const [
                      Icon(
                        Gomart.locationIcon,
                        size: 16,
                      ),
                      Text(
                        'Darmanawa, Kano',
                        style: TextStyle(
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
                  const Text(
                    'Butter Cream Cake 6 Inches',
                    style: TextStyle(color: Styles.colorBlack),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Text(
                    'N5,000',
                    style: TextStyle(
                      fontSize: 16,
                      color: Styles.colorTextBlue,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(6)),
                  const Text(
                    '3PLE F Bakers',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Styles.colorTextDark),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: const [
                      Text(
                        'Hours: ',
                        style: TextStyle(
                            fontSize: 12, color: Styles.colorTextDark),
                      ),
                      Text(
                        'Open',
                        style: TextStyle(
                            fontSize: 12, color: Styles.colorTextGreen),
                      ),
                      Text(
                        ' - Closes 5pm',
                        style: TextStyle(
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
                        const Text(
                          '08078404049',
                          style: TextStyle(
                            color: Styles.colorTextBlue,
                            fontSize: 13,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Container(
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
