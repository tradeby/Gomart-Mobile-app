import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

import '../../../../styles/custom_home_icons.dart';
import '../../../Authentication/Register/register_screen_upload_photo.dart';
import '../../../ProductDetail/product_detail.dart';

class BusinessProfileScreen extends StatelessWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: <Widget>[
                          (FirebaseAuth.instance.currentUser?.photoURL != null)
                              ? CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                      child: Image.network(
                                    FirebaseAuth.instance.currentUser?.photoURL
                                        as String,
                                    width: 60,
                                  )),
                                )
                              : CharacterAvatar(
                                  heightWidth: 40,
                                  ch: FirebaseAuth
                                          .instance.currentUser?.displayName ??
                                      'Null',
                                ),
                          const Padding(padding: EdgeInsets.all(8)),
                          Text(
                            '${FirebaseAuth.instance.currentUser?.displayName}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'Settings',
                                  style:
                                      TextStyle(color: Styles.colorTextBlack),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Icon(Icons.settings)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Styles.colorTextBlack, fontSize: 12),
                            ),
                          ),
                        ],
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
                                const Text('3ple F Bakers'),
                                Row(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.star,
                                            size: 12,
                                            color: Styles.colorSecondary),
                                        Icon(Icons.star,
                                            size: 12,
                                            color: Styles.colorSecondary),
                                        Icon(Icons.star,
                                            size: 12,
                                            color: Styles.colorSecondary),
                                        Icon(Icons.star,
                                            size: 12,
                                            color: Styles.colorSecondary),
                                        Icon(Icons.star,
                                            size: 12,
                                            color: Styles.colorSecondary),
                                      ],
                                    ),
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
                                fontSize: 12,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            const Text(
                              'Darmanawa, Kano',
                              style: TextStyle(
                                  fontSize: 12, color: Styles.colorPrimary),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Hours: Open . Closes 5pm',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(2)),
                                    Text(
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
                                  children: const [
                                    Text(
                                      '1,121 Followers',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(2)),
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

              const MapSample(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                color: Styles.colorWhite,
                child: Row(
                  children: const [
                    Icon(
                      Gomart.locationIcon,
                      size: 16,
                    ),
                    Text(
                      'Darmanawa, Kano  -  1.6 kilometers',
                      style: TextStyle(fontSize: 14),
                    ),
                    /* Row(
                      children:  [
                        const Text(
                          'Darmanawa, Kano  - ',
                          style: TextStyle(fontSize: 14),
                        ),
                        InkWell(
                          onTap: (){
                            if(kDebugMode){
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
                    ),*/
                  ],
                ),
              ),
              Container(
                color: Styles.colorWhite,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Gallery Photos',
                      style: TextStyle(fontSize: 12, color: Styles.colorGray),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Row(
                      children: List.generate(
                        7,
                        (index) => const GallaryItemBox(),
                      ),
                    )
                  ],
                ),
              ),

              const Padding(padding: EdgeInsets.all(4)),
              Container(
                color: Styles.colorWhite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Styles.colorGray.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        child: const Text('Search all 29 items')),
                    const Padding(padding: EdgeInsets.all(8)),
                    const ProductWithEditBtn(),
                    const Padding(padding: EdgeInsets.all(6)),
                    const ProductWithEditBtn(),
                    const Padding(padding: EdgeInsets.all(6)),
                    Center(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Styles.colorSecondary,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 0),
                        onPressed: () {},
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Styles.colorBlack),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              /*  ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Styles.colorSecondary,
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageProductScreen()),
                  );
                },
                child: const Text(
                  'Manage Product',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Styles.colorBlack),
                ),
              ),*/
              // const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
    );
  }
}

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
        Container(color: Styles.colorGray.withOpacity(0.4), height: 92, width: 90),
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
            const Text('N8,000',
            style: TextStyle(
              color: Styles.colorPrimary
            ),),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Updated 2 days ago',
                  style: TextStyle(
                    fontSize: 12,color: Styles.colorGray
                  ),),
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

class GallaryItemBox extends StatelessWidget {
  const GallaryItemBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          color: Styles.colorGray.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
    );
  }
}
