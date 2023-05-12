import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/styles/styles.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '_text_field.dart';
import 'bloc/business_cubit.dart';

class LogoPickSection extends StatefulWidget {
  final String? logoUrl;
  final String? businessName;
  const LogoPickSection({
    super.key,  this.logoUrl, this.businessName,
  });

  @override
  State<StatefulWidget> createState() => LogoPickSectionState();
}

class LogoPickSectionState extends State<LogoPickSection> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                child: GestureDetector(
                  onTap: () async {
                    final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                    if (image?.path != null) {
                      CroppedFile? croppedFile = await ImageCropper().cropImage(
                        sourcePath: image?.path ?? '',
                        cropStyle: CropStyle.circle,
                        uiSettings: [
                          AndroidUiSettings(
                              toolbarTitle: 'Crop photo',
                              toolbarColor: Colors.black,
                              toolbarWidgetColor: Styles.colorWhite,
                              showCropGrid: false,
                              initAspectRatio: CropAspectRatioPreset.square,
                              hideBottomControls: true,
                              lockAspectRatio: true),
                          IOSUiSettings(
                            title: 'Cropper',
                          ),
                          WebUiSettings(
                            context: context,
                          ),
                        ],
                      );
                      String? imagePath = croppedFile!.path;
                      if (!mounted) return;
                      context.read<BusinessCubit>().setLogoImage(imagePath);
                    } else {}
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: (widget.logoUrl != null)
                            ? DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            FileImage(File(widget.logoUrl.toString())))
                            : null,
                        color: Styles.colorGray.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(60)),
                    child: const Center(child: Text('Logo')),
                  ),
                )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.72,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  'Business name',
                  style: TextStyle(color: Styles.colorTextBlack),
                ),
                const Padding(padding: EdgeInsets.all(2)),
                GomTextField(
                    initialValue: widget.businessName,
                    onChanged: (_) => context
                        .read<BusinessCubit>()
                        .setBusinessName(_))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
