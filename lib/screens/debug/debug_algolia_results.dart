import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:gomart/injection.dart';

class SearchHit {
  final String name;
  final String image;

  SearchHit(this.name, this.image);

  static SearchHit fromJson(Map<String, dynamic> json) {
    return SearchHit(json['name'], json['image_urls'][0]);
  }
}

class DebugAlgoliaSearchScreen extends StatefulWidget {
  const DebugAlgoliaSearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateSavedFragment();
}

class StateSavedFragment extends State<DebugAlgoliaSearchScreen> {
  final Algolia _algoliaClient = locator<Algolia>();

  String _searchText = "";
  List<SearchHit> _hitsList = [];
  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _getSearchResult(String query) async {
    AlgoliaQuery algoliaQuery = _algoliaClient.instance
        .index("STAGING_native_ecom_demo_products")
        .query(query);
    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
    final rawHits = snapshot.toMap()['hits'] as List;
    final hits =
        List<SearchHit>.from(rawHits.map((hit) => SearchHit.fromJson(hit)));
    setState(() {
      _hitsList = hits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Algolia & Flutter'),
        ),
        body: Column(children: <Widget>[
          SizedBox(
              height: 44,
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchText.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _textFieldController.clear();
                              });
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null),
              )),
          Expanded(
              child: _hitsList.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: _hitsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            color: Colors.white,
                            height: 80,
                            padding: const EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              SizedBox(
                                  width: 50,
                                  child: Image.network(_hitsList[index].image)),
                              const SizedBox(width: 20),
                              Expanded(child: Text(_hitsList[index].name))
                            ]));
                      }))
        ]));
  }

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      if (_searchText != _textFieldController.text) {
        setState(() {
          _searchText = _textFieldController.text;
        });
        _getSearchResult(_searchText);
      }
    });
    _getSearchResult('');
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
