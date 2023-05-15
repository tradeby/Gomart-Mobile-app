import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

import '../ManageProduct/manage_product_screen.dart';
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: const BoxDecoration(
                              color: Styles.colorSecondary,
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text(
                              'Featured',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(2)),
                          Text('4 days to end',
                            style: TextStyle(
                                fontSize: 12,
                                color: Styles.colorPrimary.withOpacity(0.8)
                            ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(2)),
                      Text(
                        price,
                        style: const TextStyle(color: Styles.colorPrimary),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Updated 2 days ago',
                              style: TextStyle(
                                  fontSize: 12, color: Styles.colorGray),
                            ),
                            SizedBox(
                              height: 20,
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const ManageProductScreen()),
                                  );
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Styles.colorButtonPay,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  'Promote',
                                  style: TextStyle(
                                      color: Styles.colorTextBlack
                                          .withOpacity(0.8),
                                      fontSize: 11),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
