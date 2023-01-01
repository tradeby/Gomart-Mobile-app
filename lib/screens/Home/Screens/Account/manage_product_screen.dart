import 'package:flutter/material.dart';

import '../../../../styles/custom_home_icons.dart';
import '../../../../styles/styles.dart';
import 'business_profile_screen.dart';

class ManageProductScreen extends StatelessWidget{
  const ManageProductScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(

                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 80,
                      child: OutlinedButton(
                        onPressed: () { Navigator.of(context).pop();},
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
                              color: Styles.colorTextBlack
                                  .withOpacity(0.8),
                              fontSize: 11),
                        ),
                      ),
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
                            : GallaryItemBox(isLastItem: ((index + 1 == 7))),
                      ),
                    )
                  ],
                ),
              ),
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
                    'Save',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Styles.colorBlack),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}