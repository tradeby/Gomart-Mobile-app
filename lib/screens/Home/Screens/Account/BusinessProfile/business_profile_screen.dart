import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Home/Screens/Account/BusinessProfile/_business_profile_loading_screen.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/edit_business_screen.dart';
import 'package:gomart/screens/Home/Screens/Account/profile.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';
import 'package:gomart/shared_components/imageAddPreview/image_type_model.dart';
import 'package:gomart/styles/styles.dart';

import '../../../../../styles/custom_home_icons.dart';
import '../../../../ProductDetail/product_detail.dart';
import '../ManageProduct/manage_product_screen.dart';
import 'bloc/business_profile_cubit.dart';

class BusinessProfileScreen extends StatelessWidget {
  final String businessId;

  const BusinessProfileScreen({Key? key, required this.businessId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BusinessProfileCubit>().loadBusiness(businessId);

    return BlocBuilder<BusinessProfileCubit, BusinessProfileState>(
        builder: (context, state) {
      if (state.loading) {
        return const BusinessProfileLoading();
      }else if (state.business!=null) {
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
            child: const Icon(Icons.add, color: Styles.colorWhite,),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                          color: Styles.colorBackground,
                          image:state.business?.coverPhotoUrl!=null? DecorationImage(
                              image: NetworkImage(state.business?.coverPhotoUrl as String),
                              fit: BoxFit.cover):null,
                      ),
                      height: 114,
                    ),
                    /*Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Styles.colorBlack.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: const BackButton(
                          color: Styles.colorWhite,
                        ))),*/
                    Positioned(
                      top: 6,
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
                            child: Icon(Icons.more_vert,
                                color: Styles.colorWhite),
                          ),
                          onSelected: (String result) {
                            switch (result) {
                              case 'editBusiness':
                                (state.business!=null)?  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditBusinessScreen(businessModel:state.business!)),
                                ):null;
                                break;
                              case 'settings':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileSettingsScreen()),
                                );
                                break;
                              default:
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'editBusiness',
                              child: Text('Edit Business'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'settings',
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 6),
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
                                  image: state.business?.logoUrl!=null? DecorationImage(
                                      image: NetworkImage(state.business?.logoUrl as String),
                                      fit: BoxFit.cover):null,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.business?.companyName as String,
                                      style: const TextStyle(
                                          fontSize: 16)),
                                  Row(
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.star,
                                              size: 15,
                                              color: Styles.colorSecondary),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.all(1)),
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
                              const Padding(padding: EdgeInsets.all(2)),
                               SizedBox(
                                 width: MediaQuery.of(context).size.width*0.6,
                                 child: Text(
                              '${state.business?.address}' ,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                              ),
                               ),
                             /* const Padding(padding: EdgeInsets.all(2)),
                              const Text(
                                'Darmanawa, Kano',
                                style: TextStyle(
                                    fontSize: 12, color: Styles.colorPrimary),
                              ),*/
                              const Padding(padding: EdgeInsets.all(2)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:  [
                                      Row(
                                        children:  [
                                          const  Text(
                                            'Hours: ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Styles.colorTextDark),
                                          ),
                                          const   Text(
                                            true ? 'Open' : 'Closed',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: true //product.isOpen
                                                    ? Styles.colorTextGreen
                                                    : Styles.colorTextRed),
                                          ),
                                          Text(
                                            true // product.isOpen
                                                ? ' - Closes ${state.business?.closingTime as String}'
                                                : ' - Opens 5pm',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Styles.colorTextDark),
                                          ),
                                        ],
                                      ),
                              /*        Text(
                                        'Hours: Open . Closes ${state.business?.closingTime as String}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),*/
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
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
                    children:  [
                      const Icon(
                        Gomart.locationIcon,
                        size: 16,
                      ),
                      Text(
                        '${state.business?.address}',
                       // 'Darmanawa, Kano  -  1.6 kilometers',
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
                StoreGallerySection(
                  pGalleryPhotos:state.business?.galleryPhotos?.map((e) => ImageTypeModel(isFile: false , url: e))
                      .toList(),

                    sectionTitle: 'Add Store Gallery Photos'),
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
                                fontSize: 12,
                                color: Styles.colorTextLightGrey),
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
        );
      }else  {
          return const Center(child: Text('Error encountered'));
          }
        });
  }
}
