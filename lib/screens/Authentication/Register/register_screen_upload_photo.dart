import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Authentication/Login/otp_code_screen.dart';
import 'package:gomart/screens/Authentication/Register/bloc/registration_cubit.dart';
import 'package:gomart/screens/Authentication/Register/register_screen_otp_code.dart';
import 'package:gomart/screens/Home/home_screen.dart';
import 'package:gomart/styles/styles.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/register_state.dart';

class RegisterScreenUploadPhoto extends StatelessWidget {
  final VoidCallback onRegisterOtpPressed;

  const RegisterScreenUploadPhoto({
    Key? key,
    required this.onRegisterOtpPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Styles.colorPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Find shops & services near you',
                    style: TextStyle(color: Styles.colorWhite, fontSize: 18),
                  ),
                  const Padding(padding: EdgeInsets.all(16)),
                  Image.asset(
                    'assets/icon/gomart-logo-with-text.png',
                    width: 200,
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(16)),
            const Text('Upload Profile photo',
                style: TextStyle(color: Styles.colorTextDark)),
            const Padding(padding: EdgeInsets.all(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                UseCameraButton(),
                PickImageFromGallery(),
              ],
            ),
            const Padding(padding: EdgeInsets.all(16)),
            SectionWithoutImage(onRegisterOtpPressed: onRegisterOtpPressed)
          ],
        ),
      ),
    );
  }
}

class SectionWithoutImage extends StatelessWidget {
  final VoidCallback onRegisterOtpPressed;

  const SectionWithoutImage({Key? key, required this.onRegisterOtpPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
                (state.photoUrl != null)
                    ? 'Press next to continue'
                    : 'Or click skip to use this instead',
                style: const TextStyle(color: Styles.colorTextDark)),
            const Padding(padding: EdgeInsets.all(8)),
            (state.photoUrl != null)
                ? CircleAvatar(
                    radius: 45,
                    child: ClipOval(
                        child: Image.file(
                      File(state.photoUrl.toString()),
                      width: 120,
                    )),
                  )
                : CharacterAvatar(
                    ch: state.firstName ?? 'Null',
                  ),
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Styles.colorSecondary,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: onRegisterOtpPressed,
              child: Text(
                (state.photoUrl != null) ? 'Next' : 'Skip',
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Styles.colorBlack),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CharacterAvatar extends StatelessWidget {
  final String ch;
 final double heightWidth;
  const CharacterAvatar({Key? key, required this.ch, this.heightWidth=60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightWidth,
      width: heightWidth,
      child: Material(
        color: resolveColor(ch),
        borderRadius: BorderRadius.circular(50),
        child: Center(
          child: Text(
            ch[0],
            style:  TextStyle(
              fontSize: heightWidth==60?40:heightWidth-10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

Color resolveColor(String? ch) {
  if (ch == null) return Colors.deepPurpleAccent;
  if ('ALWCNY'.characters.contains(ch[0].toUpperCase())) return Colors.green;
  if ('BMXDOZ'.characters.contains(ch[0].toUpperCase()))
    return Colors.pinkAccent;
  if ('EPGR'.characters.contains(ch[0].toUpperCase())) return Colors.blueAccent;
  if ('FQHS'.characters.contains(ch[0].toUpperCase())) return Colors.brown;
  if ('ITKV'.characters.contains(ch[0].toUpperCase()))
    return Colors.orangeAccent;
  // if('JU'.characters.contains(ch[0].toUpperCase()))
  return Colors.indigoAccent;
}

class UseCameraButton extends StatefulWidget {
  const UseCameraButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateUseCameraButton();
}

class StateUseCameraButton extends State<UseCameraButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Styles.colorSecondary,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            onPressed: () async {
              final ImagePicker _picker = ImagePicker();
              // Pick an image
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.camera);
              if (image?.path != null) {
                CroppedFile? croppedFile = await ImageCropper().cropImage(
                  sourcePath: image?.path ?? '',
                  aspectRatioPresets: [
                    CropAspectRatioPreset.square,
                  ],
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
                      title: 'Crop photo',
                    ),
                    WebUiSettings(
                      context: context,
                    ),
                  ],
                );
                String? imagePath = croppedFile!.path;
                if (!mounted) return;
                context.read<RegistrationCubit>().setProfileImage(imagePath);
              } else {
                print("Error encountered");
              }
            },
            child: const Icon(Icons.camera_alt)),
        const Padding(padding: EdgeInsets.all(4)),
        const Text('Use camera',
            style: TextStyle(
              fontSize: 12,
              color: Styles.colorTextDark,
            )),
      ],
    );
  }
}

class PickImageFromGallery extends StatefulWidget {
  const PickImageFromGallery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StatePickImageFromGallery();
}

class StatePickImageFromGallery extends State<PickImageFromGallery> {
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
    return Column(
      children: <Widget>[
        ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Styles.colorSecondary,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            onPressed: () async {
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
                context.read<RegistrationCubit>().setProfileImage(imagePath);
              } else {}
            },
            child: const Icon(Icons.cloud_upload)),
        const Padding(padding: EdgeInsets.all(4)),
        const Text('Upload photo',
            style: TextStyle(
              fontSize: 12,
              color: Styles.colorTextDark,
            )),
      ],
    );
  }
}
