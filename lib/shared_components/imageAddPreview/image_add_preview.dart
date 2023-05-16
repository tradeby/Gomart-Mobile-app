import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gomart/screens/ProductDetail/fade_route.dart';
import 'package:gomart/screens/ProductDetail/image_preview_screen.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'package:gomart/styles/styles.dart';

import '_add_new_gallery_item_box.dart';
import '_gallary_item_box.dart';
import 'image_type_model.dart';

class StoreGallerySection extends StatefulWidget {
  final List<ImageTypeModel>? pGalleryPhotos;
  final Function(ImageTypeModel image)? onImagePicked;
  final Function(ImageTypeModel image)? onImageRemoved;
  final String? sectionTitle;

  const StoreGallerySection(
      {super.key,
      this.pGalleryPhotos,
      this.onImagePicked,
      this.onImageRemoved,
      this.sectionTitle});

  @override
  State<StatefulWidget> createState() => _StoreGallerySection();
}

class _StoreGallerySection extends State<StoreGallerySection> {
  List<ImageTypeModel> galleryPhotos = [];
  int? galleryIndex;

  _onImageTap(ImageTypeModel imagePath, int index) {
    setState(() {
      galleryIndex = index;
    });
  }

  _onImagePicked(ImageTypeModel image) {
    setState(() {
      galleryPhotos = galleryPhotos + [image];
      galleryIndex = galleryPhotos.length - 1;
    });
    widget.onImagePicked!(image);
  }

  _onImageDeleted(ImageTypeModel image) {
    final newGallery = galleryPhotos.where((e) => e.url != image.url).toList();
    setState(() {
      galleryPhotos = newGallery;
      galleryIndex = newGallery.isEmpty ? null : newGallery.length - 1;
    });
    widget.onImageRemoved!(image);
  }

  @override
  void initState() {
    if (widget.pGalleryPhotos != null) {
      setState(() {
        galleryPhotos = widget.pGalleryPhotos as List<ImageTypeModel>;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorWhite,
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.sectionTitle != null
              ? Column(
                  children: [
                    Text(
                      widget.sectionTitle!,
                      style: const TextStyle(color: Styles.colorTextBlack),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                  ],
                )
              : Container(),
          (galleryIndex != null)
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: (galleryPhotos.isNotEmpty && galleryIndex != null)
                          ? () {
                              Navigator.push(
                                context,
                                FadeRoute(
                                  page: ImagePreview(
                                    enableSharing: false,
                                    isFile: galleryPhotos[galleryIndex as int]
                                        .isFile,
                                    imageUrl:
                                        galleryPhotos[galleryIndex as int].url,
                                    heroTag: UniqueKey().toString(),
                                    productName: 'product.productName',
                                    productUrl: 'product.productUrl',
                                  ),
                                ),
                              );
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        height: MediaQuery.of(context).size.width * 0.55,
                        width: MediaQuery.of(context).size.width * 0.95,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                            image: (galleryPhotos.isNotEmpty &&
                                    galleryIndex != null)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: galleryPhotos[galleryIndex as int]
                                            .isFile
                                        ? FileImage(File(
                                            galleryPhotos[galleryIndex as int]
                                                .url)) as ImageProvider
                                        : NetworkImage(
                                            galleryPhotos[galleryIndex as int]
                                                .url))
                                : null,
                            color: Styles.colorBackground,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: IconButton(
                          color: Styles.colorWhite,
                          icon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 4),
                            decoration: BoxDecoration(
                                color: Styles.colorBlack.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Icon(Gomart.trashCanIcon,
                                color: Styles.colorWhite),
                          ),
                          onPressed: () {
                            _onImageDeleted(galleryPhotos[galleryIndex as int]);
                          },
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                  ],
                )
              : Container(),
          Wrap(
            runSpacing: 6,
            children: List.generate(
              (1 + galleryPhotos.length) < 6 ? 6 : 1 + galleryPhotos.length,
              (index) => index == 0
                  ? AddNewGallaryItemBox(onImagePicked: _onImagePicked)
                  : (index < 1 + galleryPhotos.length)
                      ? GallaryItemBox(
                          index: index - 1,
                          image: galleryPhotos[index - 1],
                          isLastItem: ((index + 1 == 1 + galleryPhotos.length)),
                          onClick: _onImageTap)
                      : GallaryItemBox(
                          index: index - 1,
                          isLastItem: ((index + 1 == 6)),
                          onClick: (f, i) {}),
            ),
          )
        ],
      ),
    );
  }
}
