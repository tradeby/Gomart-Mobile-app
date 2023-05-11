import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/_map_edit_business.dart';
import 'package:google_maps_webservice/places.dart';
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
              const UploadBannerSection(),
              const Padding(padding: EdgeInsets.all(6)),
              const LogoPickSection(),
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
                        children: [
                          const Text(
                            'Opening hours',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          SizedBox(
                            height: 32,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: '08:00 am',
                                  child: Text('08:00 am'),
                                ),
                                DropdownMenuItem(
                                  value: '09:00 pm',
                                  child: Text('09:30 am'),
                                ),
                              ],
                              onChanged: (value) {
                                // Handle value change
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Closing hours',
                            style: TextStyle(color: Styles.colorTextBlack),
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                          SizedBox(
                            height: 32,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: '11:00 pm',
                                  child: Text('11:00 pm'),
                                ),
                                DropdownMenuItem(
                                  value: '13:00 pm',
                                  child: Text('11:30 pm'),
                                ),
                              ],
                              onChanged: (value) {
                                // Handle value change
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: 'Item 1',
                                  child: Text('All Week',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                                DropdownMenuItem(
                                  value: 'Item 2',
                                  child: Text('Monday to Saturday',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                                DropdownMenuItem(
                                  value: 'Item 3',
                                  child: Text(
                                    'Weekends only',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                // Handle value change
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

  _onLatLngSet(lat, lng) async {
    setState(() {
      loadingMap = true;
    });

    String _address = await getAddressFromLatLng(lat, lng);
    print('**********->$_address');
    await Future.delayed(const Duration(milliseconds: 20));

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
