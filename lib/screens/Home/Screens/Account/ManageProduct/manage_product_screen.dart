import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';

import '../../../../../styles/styles.dart';
import '../BusinessProfile/business_profile_screen.dart';
import '../EditBusiness/_text_field.dart';
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BusinessProfileScreen()),
                      );
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Styles.colorBlack),
                    ),
                  ),
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

