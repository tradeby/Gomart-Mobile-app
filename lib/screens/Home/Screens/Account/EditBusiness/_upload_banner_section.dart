
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../styles/styles.dart';
import 'bloc/business_cubit.dart';

class UploadBannerSection extends StatefulWidget {
  const UploadBannerSection({super.key});

  @override
  State<StatefulWidget> createState() => UploadBannerSectionState();
}

class UploadBannerSectionState extends State<UploadBannerSection> {
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
    return Stack(
      children: [
        BlocBuilder<BusinessCubit, BusinessState>(builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: (state.bannerUrl != null)
                  ? DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(File(state.bannerUrl.toString())))
                  : null,
              color: Styles.colorGray.withOpacity(0.08),
            ),
            height: 114,
            child: Center(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Styles.colorWhite,
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    elevation: 0),
                onPressed: () async {
                  final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
                  if (image?.path != null) {
                    CroppedFile? croppedFile = await ImageCropper().cropImage(
                      sourcePath: image?.path ?? '',
                      cropStyle: CropStyle.rectangle,
                      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 6),
                      uiSettings: [
                        AndroidUiSettings(
                            toolbarTitle: 'Crop photo',
                            toolbarColor: Colors.black,
                            toolbarWidgetColor: Styles.colorWhite,
                            showCropGrid: false,
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
                    context.read<BusinessCubit>().setBannerImage(imagePath);
                  } else {}
                },
                child: const Text(
                  'Upload banner',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Styles.colorBlack),
                ),
              ),
            ),
          );
        }),
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
      ],
    );
  }
}
