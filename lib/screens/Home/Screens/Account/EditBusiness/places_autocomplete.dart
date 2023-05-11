

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

class PlacesAutoCompleteWidget extends StatefulWidget {
  @override
  _PlacesAutoCompleteWidgetState createState() =>
      _PlacesAutoCompleteWidgetState();
}

class _PlacesAutoCompleteWidgetState extends State<PlacesAutoCompleteWidget> {
  final _textController = TextEditingController();
  final _places = GoogleMapsPlaces(apiKey: 'YOUR_API_KEY');
  List<Prediction> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Enter a location',
          ),
          onChanged: _onTextChanged,
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
    );
  }

  void _onTextChanged(String value) async {
    final response = await _places.autocomplete(
      value,
      language: 'en',
      types: ['(cities)'],
      components: [Component(Component.country, 'us')],
    );
    setState(() {
      _suggestions = response.predictions;
    });
  }

  void _onSuggestionSelected(Prediction prediction) async {
   // final details = await _places.getDetailsByPlaceId(prediction.placeId);
    // do something with the place details
  }
}
