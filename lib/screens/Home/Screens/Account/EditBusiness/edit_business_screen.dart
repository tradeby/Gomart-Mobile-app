import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../styles/custom_home_icons.dart';
import '../../../../../styles/styles.dart';
import '../business_profile_screen.dart';
import 'bloc/business_cubit.dart';

class EditBusinessScreen extends StatelessWidget {
  const EditBusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*  Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: <Widget>[
                          (FirebaseAuth.instance.currentUser?.photoURL != null)
                              ? CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                      child: Image.network(
                                    FirebaseAuth.instance.currentUser?.photoURL
                                        as String,
                                    width: 60,
                                  )),
                                )
                              : CharacterAvatar(
                                  heightWidth: 40,
                                  ch: FirebaseAuth
                                          .instance.currentUser?.displayName ??
                                      'Null',
                                ),
                          const Padding(padding: EdgeInsets.all(8)),
                          Text(
                            '${FirebaseAuth.instance.currentUser?.displayName}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'Settings',
                                  style:
                                      TextStyle(color: Styles.colorTextBlack),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                                Icon(Icons.settings)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),*/
              UploadBannerSection(),
              const Padding(padding: EdgeInsets.all(6)),
              LogoPickSection(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Phone number',
                                style: TextStyle(color: Styles.colorTextBlack),
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              BTextField()
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Email address',
                                style: TextStyle(color: Styles.colorTextBlack),
                              ),
                              Padding(padding: EdgeInsets.all(2)),
                              BTextField()
                            ],
                          ),
                        )
                      ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Opening hours',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          BTextField()
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Closing hours',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          BTextField()
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Days open',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          BTextField()
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'State',
                            style: TextStyle(color: Styles.colorGray),
                          ),
                          const Padding(padding: EdgeInsets.all(2)),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Styles.colorGray,
                                width: 1,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your area',
                            style: TextStyle(color: Styles.colorGray),
                          ),
                          const Padding(padding: EdgeInsets.all(2)),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Styles.colorGray,
                                width: 1,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(6)),*/
              const MapEditBusiness(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                color: Styles.colorWhite,
                child: const Text(
                  'Use my current location as my address',
                  style: TextStyle(fontSize: 14, color: Styles.colorPrimary),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Enter address',
                      style: TextStyle(color: Styles.colorTextBlack),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    BTextField()
                  ],
                ),
              ),
              StoreGallerySection(),
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

class StoreGallerySection extends StatelessWidget {
  const StoreGallerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.colorWhite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Add Store Gallery Photos',
            style: TextStyle(color: Styles.colorTextBlack),
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
    );
  }
}

class LogoPickSection extends StatefulWidget {
  const LogoPickSection({
    super.key,
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
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<BusinessCubit, BusinessState>(
                builder: (context, state) {
              return SizedBox(
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
                          image: (state.logoUrl != null)
                              ? DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(File(state.logoUrl.toString())))
                              : null,
                          color: Styles.colorGray.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(60)),
                      child: const Center(child: Text('Logo')),
                    ),
                  ));
            }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Business name',
                    style: TextStyle(color: Styles.colorTextBlack),
                  ),
                  Padding(padding: EdgeInsets.all(2)),
                  BTextField()
                ],
              ),
            ),
          ],
        ),

    );
  }
}

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
                      fit: BoxFit.fill,
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
                    color: Styles.colorBlack.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50)),
                child: const BackButton(
                  color: Styles.colorWhite,
                ))),
      ],
    );
  }
}

class BTextField extends StatelessWidget {
  const BTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: Styles.colorTextFieldBorder,
          width: 0.8,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

class MapEditBusiness extends StatefulWidget {
  const MapEditBusiness({Key? key}) : super(key: key);

  @override
  State<MapEditBusiness> createState() => MapEditBusinessState();
}

class MapEditBusinessState extends State<MapEditBusiness> {
  final Completer<GoogleMapController> _controller = Completer();
  Circle circles = Circle(
    circleId: CircleId('circle_id_${DateTime.now().millisecondsSinceEpoch}'),
    center: const LatLng(12.0037545, 8.5327996),
    fillColor: const Color(0xffCADDE8).withOpacity(0.54),
    strokeColor: const Color(0xff66B8CA),
    strokeWidth: 2,
    radius: 180,
  );
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.0037545, 8.5327996),
    zoom: 15.2,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        //circles: {circles},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
