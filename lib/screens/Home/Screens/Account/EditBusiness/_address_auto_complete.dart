import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';
import 'package:google_maps_webservice/places.dart';

class EnterAddressAutoComplete extends StatefulWidget {
  const EnterAddressAutoComplete({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => EnterAddressAutoCompleteState();
}

class EnterAddressAutoCompleteState extends State<EnterAddressAutoComplete> {
  final _textController = TextEditingController();
  final _places =
  GoogleMapsPlaces(apiKey: 'AIzaSyDo0KVqGLzCqIUks4a8UJSuAJSW_k3ec3o');
  List<Prediction> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter address',
            style: TextStyle(color: Styles.colorTextBlack),
          ),
          const Padding(padding: EdgeInsets.all(2)),
          SizedBox(
            height: 32,
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                  focusColor: Styles.colorGray,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Styles.colorTextFieldBorder,
                        width: 0.8,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              onChanged: _onTextChanged,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _suggestions.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_suggestions[index].description as String),
                onTap: () => _onSuggestionSelected(_suggestions[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onTextChanged(String value) async {
    final response = await _places.autocomplete(
      value,
      components: [Component(Component.country, 'ng')],
    );

    print(response.predictions);

    setState(() {
      _suggestions = response.predictions;
    });
  }

  void _onSuggestionSelected(Prediction prediction) async {
    final details =
    await _places.getDetailsByPlaceId(prediction.placeId as String);

    double? lat =  details.result.geometry?.location.lat;
    double? lng =  details.result.geometry?.location.lng;

    print('$lat, $lng');
    // do something with the place details
    setState(() {
      _suggestions = [];
      _textController.text = prediction.description as String;
    });
  }
}
