import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

class ProductWithEditBtn extends StatelessWidget {
  const ProductWithEditBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            color: Styles.colorGray.withOpacity(0.4), height: 92, width: 90),
        const Padding(padding: EdgeInsets.all(4)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Text(
                  'Fill your Own Box of 12 Cupcakes I Mix & Match Your Favorite Flavours'),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            const Text(
              'N8,000',
              style: TextStyle(color: Styles.colorPrimary),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Updated 2 days ago',
                    style: TextStyle(fontSize: 12, color: Styles.colorGray),
                  ),
                  SizedBox(
                    height: 20,
                    width: 60,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            color: Styles.colorGray,
                            style: BorderStyle.solid,
                            width: 1,
                          )),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Styles.colorTextBlack.withOpacity(0.8),
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
    );
  }
}
