import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Home/Screens/Account/BusinessProfile/business_profile_screen.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:gomart/styles/styles.dart';

import 'bloc/business_cubit.dart';

class StoreGallerySection extends StatelessWidget {
  const StoreGallerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorWhite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Add Store Gallery Photos',
            style: TextStyle(color: Styles.colorTextBlack),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          BlocBuilder<BusinessCubit, BusinessState>(builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.width * 0.55,
              width: MediaQuery.of(context).size.width * 0.95,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  image: (state.gallaryPhotos.isNotEmpty &&
                      state?.gallaryIndex != null)
                      ? DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(
                          state.gallaryPhotos[state.gallaryIndex as int])))
                      : null,
                  color: Styles.colorBackground,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: const Icon(Gomart.trashCanIcon, color: Styles.colorGray),
            );
          }),
          const Padding(padding: EdgeInsets.all(4)),
          BlocBuilder<BusinessCubit, BusinessState>(builder: (context, state) {
            return Wrap(
              runSpacing: 6,
              children: List.generate(
                1 + state.gallaryPhotos.length,
                    (index) => index == 0
                    ? const AddNewGallaryItemBox()
                    : GallaryItemBox(
                    index: index - 1,
                    imagePath: state.gallaryPhotos[index - 1],
                    isLastItem:
                    ((index + 1 == 1 + state.gallaryPhotos.length))),
              ),
            );
          }),
        ],
      ),
    );
  }
}

