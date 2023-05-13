import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/_map_edit_business.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/bloc/business_cubit.dart';
import 'package:google_maps_webservice/places.dart';
import '../../../../../shared_components/supportedOpeningClosingTimes/_supported_times.dart';
import '../../../../../styles/custom_home_icons.dart';
import '../../../../../styles/styles.dart';
import '../BusinessProfile/business_profile_screen.dart';
import '_address_auto_complete.dart';
import '_get_current_location.dart';
import '_logo_pick_section.dart';
import '_store_gallary_section.dart';
import '_text_field.dart';
import '_upload_banner_section.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

GlobalKey _dialogKey = GlobalKey();

class EditBusinessScreen extends StatefulWidget {
  const EditBusinessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditBusinessScreenState();
}

class _EditBusinessScreenState extends State<EditBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BusinessCubit, BusinessState>(
      listener: (context, state) {},
      child: BlocBuilder<BusinessCubit, BusinessState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Styles.colorWhite,
            body: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const UploadBannerSection(),
                        const Padding(padding: EdgeInsets.all(6)),
                        const LogoAndFieldsSection(),
                        const AddressAndMap(),
                        const StoreGallerySection(),
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
                              onPressed: () async {
                                context.read<BusinessCubit>().saveBusiness();
                                /* Navigator.push(
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
                        ),
                        const Padding(padding: EdgeInsets.all(12))
                      ],
                    ),
                  ),
                ),
                  (state.saving == true)
                    ? const LoadingDialog()
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Styles.colorWhite.withOpacity(0.9),
          child:  Center(
            child:Image.asset('assets/icon/icon-true-round.png',
            height: 60,),
          ),
        ),
        const Center(
          child: SizedBox(
            width: 60 * 1.20,
            height: 60 * 1.20,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Styles.colorSecondary),
              backgroundColor: Styles.colorButtonPay,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Text('Saving changes'),
          ),
        )
      ],
    );
  }
}

class LogoAndFieldsSection extends StatelessWidget {
  const LogoAndFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessState>(builder: (context, state) {
      return Column(
        children: [
          LogoPickSection(
              logoUrl: state.logoUrl, businessName: state.businessName),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone number',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          const Padding(padding: EdgeInsets.all(2)),
                          GomTextField(
                              initialValue: state.phoneNumber,
                              onChanged: (_) => context
                                  .read<BusinessCubit>()
                                  .setPhoneNumber(_))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email address',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          const Padding(padding: EdgeInsets.all(2)),
                          GomTextField(
                              initialValue: state.emailAddress,
                              onChanged: (_) => context
                                  .read<BusinessCubit>()
                                  .setEmailAddress(_))
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Opening hours',
                        style: TextStyle(color: Styles.colorTextBlack),
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      SizedBox(
                        height: 32,
                        child: DropdownButtonFormField(
                            value: state.openingTime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            items: List.generate(
                                supportedTimeConverted.length,
                                (index) => DropdownMenuItem(
                                      value: supportedTimeConverted[index],
                                      child:
                                          Text(supportedTimeConverted[index]),
                                    )),
                            onChanged: (_) => context
                                .read<BusinessCubit>()
                                .setOpeningTime(_)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Closing hours',
                        style: TextStyle(color: Styles.colorTextBlack),
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      SizedBox(
                        height: 32,
                        child: DropdownButtonFormField(
                            value: state.closingTime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 6),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            items: List.generate(
                                supportedTimeConverted.length,
                                (index) => DropdownMenuItem(
                                      value: supportedTimeConverted[index],
                                      child:
                                          Text(supportedTimeConverted[index]),
                                    )),

                            /* const [
                            DropdownMenuItem(
                              value: '11:00 pm',
                              child: Text('11:00 pm'),
                            ),
                            DropdownMenuItem(
                              value: '13:00 pm',
                              child: Text('11:30 pm'),
                            ),
                          ],*/
                            onChanged: (_) => context
                                .read<BusinessCubit>()
                                .setClosingTime(_)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Days open',
                        style: TextStyle(color: Styles.colorTextBlack),
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      SizedBox(
                        height: 32,
                        child: DropdownButtonFormField(
                          value: state.daysOpen,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          items: List.generate(
                              supportedDays.length,
                              (index) => DropdownMenuItem(
                                    value: supportedDays[index],
                                    child: Text(supportedDays[index]),
                                  )),
                          onChanged: (_) =>
                              context.read<BusinessCubit>().setDaysOpen(_),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class AddressAndMap extends StatefulWidget {
  const AddressAndMap({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AddressAndMapState();
}

class _AddressAndMapState extends State<AddressAndMap> {
  double? latitude;
  double? longitude;
  String address = '';
  bool loadingMap = false;

  @override
  void initState() {
    final businessBloc = BlocProvider.of<BusinessCubit>(context);
    final currentState = businessBloc.state;
    if (currentState.locationMap != null) {
      latitude = currentState.locationMap?.latitude;
      longitude = currentState.locationMap?.longitude;
      address = currentState.locationMap?.address as String;
    }

    super.initState();
  }

  _onLatLngSet(lat, lng) async {
    setState(() {
      loadingMap = true;
    });

    String _address = await getAddressFromLatLng(lat, lng);
    if (kDebugMode) {
      print('**********->$_address');
    }
    //await Future.delayed(const Duration(milliseconds: 20));
    //dispatch from here
    if (context.mounted) {
      context.read<BusinessCubit>().setMapLocation(
          LocationMap(longitude: lng, latitude: lat, address: _address));
    }

    setState(() {
      longitude = lng;
      latitude = lat;
      address = _address;
    });

    setState(() {
      loadingMap = false;
    });
  }

  _onAddressChange(String addressDesc, String formattedAddr) {
    setState(() {
      address = formattedAddr;
    });
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    final apiKey = 'AIzaSyDo0KVqGLzCqIUks4a8UJSuAJSW_k3ec3o';
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final formattedAddress = json['results'][0]['formatted_address'];
    return formattedAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (latitude != null && longitude != null && !loadingMap)
            ? MapEditBusiness(
                latitude: latitude as double, longitude: longitude as double)
            : Container(
                color: Styles.colorSkeletalBackground,
                height: 90,
                child: const Center(
                  child: Text('Enter address to show on Map',
                      style: TextStyle(color: Styles.colorGray)),
                ),
              ),
        GetCurrentLocation(onLatitudeSet: _onLatLngSet),
        (!loadingMap)
            ? EnterAddressAutoComplete(
                onLatitudeSet: _onLatLngSet,
                onAddressChange: _onAddressChange,
                initialAddress: address,
              )
            : Container(),
      ],
    );
  }
}
