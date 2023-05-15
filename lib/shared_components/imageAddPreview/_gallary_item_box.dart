import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/shared_components/imageAddPreview/image_type_model.dart';
import 'package:gomart/styles/styles.dart';

class GallaryItemBox extends StatelessWidget {
  final bool isLastItem;
  final ImageTypeModel? image;
  final int index;
  final Function(ImageTypeModel imagePath, int index) onClick;

  const GallaryItemBox(
      {Key? key,
      this.isLastItem = false,
      this.image,
      required this.index,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (image != null)
          ? () {
              onClick(image!, index);
              // context.read<BusinessCubit>().setGallaryIndex(index);
            }
          : null,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, isLastItem ? 0 : 7, 0),
        height: 46,
        width: 46,
        decoration: BoxDecoration(
            image: (image != null)
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: image?.isFile == true
                        ? FileImage(File(image?.url as String)) as ImageProvider
                        : NetworkImage(image?.url as String))
                : null,
            color: Styles.colorBackground,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}
