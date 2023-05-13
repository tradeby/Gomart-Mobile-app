import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/edit_business_screen.dart';
import 'package:gomart/styles/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../styles/custom_home_icons.dart';
import '../../../../Authentication/Register/register_screen_upload_photo.dart';
import '../../../../ProductDetail/product_detail.dart';
import '../EditBusiness/bloc/business_cubit.dart';
import '../ManageProduct/manage_product_screen.dart';

class BusinessProfileScreen extends StatelessWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ManageProductScreen()),
          );
        },
        backgroundColor: Styles.colorPrimary,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*   Container(
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
              ),*/
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
                              color: Styles.colorBlack.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child: const BackButton(
                            color: Styles.colorWhite,
                          ))),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: PopupMenuButton<String>(
                        color: Styles.colorWhite,
                        elevation: 2,
                        shadowColor: Styles.colorBlack,
                        icon: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 4),
                          decoration: BoxDecoration(
                              color: Styles.colorBlack.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50)),
                          child:
                              Icon(Icons.more_vert, color: Styles.colorWhite),
                        ),
                        onSelected: (String result) {
                          switch (result) {
                            case 'filter1':
                              print('filter 1 clicked');
                              break;
                            case 'filter2':
                              print('filter 2 clicked');
                              break;
                            case 'clearFilters':
                              print('Clear filters');
                              break;
                            default:
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'filter1',
                            child: Text('Edit Business'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'filter1',
                            child: Text('Settings'),
                          ),
                        ],
                      ),
                      /*PopupMenuButton<String>(
                          onSelected: (String result) {
                            switch (result) {
                              case 'option1':
                                print('option 1 clicked');
                                break;
                              case 'option2':
                                print('option 2 clicked');
                                break;
                              case 'delete':
                                print('I want to delete');
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'option1',
                              child: Text('Option 1'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'option2',
                              child: Text('Option 2'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        )
                        ]*/
                      /* child: SizedBox(
                        height: 20,
                        width: 60,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Styles.colorWhite,
                              shape: const StadiumBorder(),
                              side: const BorderSide(
                                color: Styles.colorGray,
                                style: BorderStyle.solid,
                                width: 1,
                              )),
                          child: Text(
                            'Modify business',
                            style: TextStyle(
                                color: Styles.colorTextBlack.withOpacity(0.8),
                                fontSize: 11),
                          ),
                        ),
                      ),*/
                    ),
                  )
                ],
              ),
              Container(
                  color: Styles.colorWhite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
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
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Store Gallery Photos',
                      style: TextStyle(color: Styles.colorGray),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.width * 0.55,
                      width: MediaQuery.of(context).size.width * 0.95,
                      alignment: Alignment.topRight,
                      decoration: const BoxDecoration(
                          color: Styles.colorBackground,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: const Icon(Gomart.trashCanIcon,
                          color: Styles.colorGray),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Row(
                      children: List.generate(
                        7,
                        (index) => index == 0
                            ? const AddNewGallaryItemBox()
                            : GallaryItemBox(
                                index: index - 1,
                                isLastItem: ((index + 1 == 7))),
                      ),
                    )
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
                    const Padding(padding: EdgeInsets.all(6)),
                    const ProductDetailItem(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2Fproduct2.png?alt=media&token=c1a89179-590e-4d51-aedd-003623274e0d',
                      productTitle:
                          'Fill Your Own Box of 12 Cupcakes I Mix & Match Your Favorite Flavours',
                      price: 'N6,000',
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    /*      Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Styles.colorSecondary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 80),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const ManageProductScreen()),
                            );
                          },
                          child: const Text(
                            'Create new post',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Styles.colorBlack),
                          ),
                        ),
                      ),
                    ),*/
                    const Padding(padding: EdgeInsets.all(12))
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
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

class GallaryItemBox extends StatelessWidget {
  final bool isLastItem;
  final String? imagePath;
  final int index;

  const GallaryItemBox(
      {Key? key, this.isLastItem = false, this.imagePath, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BusinessCubit>().setGallaryIndex(index);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, isLastItem ? 0 : 7, 0),
        height: 46,
        width: 46,
        decoration: BoxDecoration(
            image: (imagePath != null)
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(imagePath.toString())))
                : null,
            color: Styles.colorBackground,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}

class AddNewGallaryItemBox extends StatefulWidget {
  const AddNewGallaryItemBox({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddNewGallaryItemBoxState();
}

class AddNewGallaryItemBoxState extends State<AddNewGallaryItemBox> {
  late ImagePicker _picker;

  @override
  void initState() {
    _picker = ImagePicker();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          if (!mounted) return;

            context.read<BusinessCubit>().setGalleryImage(image.path);

        } else {}
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
        height: 46,
        width: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Styles.colorGray.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: const Icon(Icons.add_circle_sharp, color: Styles.colorPrimary),
      ),
    );
  }
}
