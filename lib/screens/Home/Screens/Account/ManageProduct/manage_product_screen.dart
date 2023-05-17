import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';

import '../../../../../styles/styles.dart';
import '../BusinessProfile/business_profile_screen.dart';
import 'PromoteAd/promote_ad_section.dart';
import 'Specifications/specifications_section.dart';
import '_product_form_section.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                child: SizedBox(
                  height: 25,
                  width: 80,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Styles.colorGray,
                          style: BorderStyle.solid,
                          width: 1,
                        )),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Styles.colorTextBlack.withOpacity(0.8),
                          fontSize: 11),
                    ),
                  ),
                ),
              ),
              const StoreGallerySection(),
              const ProductFormSection(),
              const Padding(padding: EdgeInsets.all(6.0)),
              const SpecificationsSection(),
              const Padding(padding: EdgeInsets.all(6)),
              const PromoteAdSection(),
              const Padding(padding: EdgeInsets.all(6)),
              const SaveButtonManageProduct(),
              const Padding(padding: EdgeInsets.all(12))
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButtonManageProduct extends StatelessWidget {
  const SaveButtonManageProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                        color: Styles.colorWhite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(18)),
                            Container(
                              padding: const EdgeInsets.all(12),
                              color: const Color(0xffD9EBF0).withOpacity(0.4),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Image.asset('assets/icon/icon-true-round.png',
                                  height: 45,),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:   [
                                      Container(
                                        padding:
                                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                        decoration: const BoxDecoration(
                                          color: Styles.colorSecondary,
                                          borderRadius:  BorderRadius.all(Radius.circular(6)),
                                        ),
                                        child: const Text('Featured'),
                                      ),
                                      const Padding(padding: EdgeInsets.all(4)),
                                     const  Text('Ad will run for 30 days',
                                     style: TextStyle(
                                       fontSize: 12,
                                       color: Styles.colorTextLightGrey
                                     ),)
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const  [
                                      Text('N2,500',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600

                                      ),),
                                      Text('N2,999',
                                        style: TextStyle(
                                          color: Styles.colorTextLightGrey


                                        ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const PaymentMethodSelect(),
                            const Padding(padding: EdgeInsets.all(14)),
                            Center(
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
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'Checkout',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Styles.colorBlack),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Styles.colorBarBottomSheet,
                              ),
                              height: 5,
                              width: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

        /*    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const BusinessProfileScreen()),
            );*/
          },
          child: const Text(
            'Save',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Styles.colorBlack),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodSelect extends StatelessWidget {
  const PaymentMethodSelect({
    super.key,
  });


  void showPopupMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero),
            ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final isSelected = false;
    showMenu(
      context: context,
      position: position,
      items:[
      PopupMenuItem(
      value: 'h',
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Image.asset('assets/icon/wallet_logo.png',
                height: 30),
            const Padding(padding: EdgeInsets.all(4)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:    [
                Row(
                  children: const [

                    Text('N30,000.00',
                      style: TextStyle(
                        fontSize:16,
                      ),)

                  ],
                ),
                const Text('Wallet balance',
                  style: TextStyle(
                      fontSize: 14,
                      color: Styles.colorTextLightGrey
                  ),)
              ],
            ),
            const Spacer(),
            Icon(
              isSelected?Icons.check_circle:  Icons.circle_outlined,
              color: isSelected?Styles.colorPrimary: Styles.colorGray,
              size: 18,
            ),
          ],
        ),
      ),
    ),
        PopupMenuItem(
          value: 'h',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [

                Image.asset('assets/icon/master_card_lg.png',
                    height: 25),
                const Padding(padding: EdgeInsets.all(8)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:    [
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Text('6342',
                          style: TextStyle(
                            fontSize:16,
                          ),),
                      ],
                    ),
                    const Text('Musa Jahun',
                      style: TextStyle(
                          fontSize: 14,
                          color: Styles.colorTextLightGrey
                      ),)
                  ],
                ),
                Spacer(),
                Icon(
                  !isSelected?Icons.check_circle:  Icons.circle_outlined,
                  color: !isSelected?Styles.colorPrimary: Styles.colorGray,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'h',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image.asset('assets/icon/visa_card_lg2.png',
                    height: 25),
                const Padding(padding: EdgeInsets.all(8)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:    [
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                            Padding(padding: EdgeInsets.all(1)),
                            Icon(Icons.circle, size: 10),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        const Text('4253',
                          style: TextStyle(
                            fontSize:16,
                          ),)
                      ],
                    ),
                    const Text('Musa Suleiman Jahun',
                      style: TextStyle(
                          fontSize: 14,
                          color: Styles.colorTextLightGrey
                      ),)
                  ],
                ),
                const Spacer(),
                Icon(
                  isSelected?Icons.check_circle:  Icons.circle_outlined,
                  color: isSelected?Styles.colorPrimary: Styles.colorGray,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'h',
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icon/card_generic.png',
                    height: 30,
                width: 35,),
                const Padding(padding: EdgeInsets.all(4)),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text('Add debit/credit card',
                    style: TextStyle(
                      fontSize:16,
                    ),),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ],
      elevation: 8,
    ).then((String? value) {
      if (value != null) {
        //widget.onTemplateSelect!(value);
        // Handle the selected option
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showPopupMenu(context);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: (){
            showPopupMenu(context);
          },child: Row(
            children: [
              Image.asset('assets/icon/master_card_lg.png',
                height: 30),
              const Padding(padding: EdgeInsets.all(4)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:    [
                  Row(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.circle, size: 10),
                          Padding(padding: EdgeInsets.all(1)),
                          Icon(Icons.circle, size: 10),
                          Padding(padding: EdgeInsets.all(1)),
                          Icon(Icons.circle, size: 10),
                          Padding(padding: EdgeInsets.all(1)),
                          Icon(Icons.circle, size: 10),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      const Text('6342',
                        style: TextStyle(
                            fontSize:16,
                        ),),
                      const Icon(Icons.expand_more,
                      size: 30,)
                    ],
                  ),
                  const Text('Musa Jahun',
                    style: TextStyle(
                        fontSize: 14,
                        color: Styles.colorTextLightGrey
                    ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

