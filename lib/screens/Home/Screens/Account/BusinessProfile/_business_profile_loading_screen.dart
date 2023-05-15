import 'package:flutter/material.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';
import 'package:gomart/styles/styles.dart';

class BusinessProfileLoading extends StatelessWidget {
  const BusinessProfileLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
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
                      top: 10,
                      right: 5,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Styles.colorWhite.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(Icons.more_vert)))
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
              Container(
                  height: 90,
                  decoration:  BoxDecoration(
                    color: Styles.colorGray.withOpacity(0.15),
                  )),
               const StoreGallerySection(),
              // const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
    );
  }
}


