import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/Home/home.dart';
import 'package:gomart/screens/Search/search_results.dart';
import 'package:gomart/styles/styles.dart';

class SearchInputScreen extends StatelessWidget {
  const SearchInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 105),
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Styles.colorBackground,
                  child: Row(
                    children: [
                      const BackButton(),
                      Container(
                        decoration: const BoxDecoration(
                            color: Styles.colorBackground,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: const EdgeInsets.only(left: 10),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.86,
                        //backgroundColor: Styles.colorWhite,
                        child: TextFormField(
                          autofocus: true,
                          cursorColor: Styles.colorTextDark,
                          decoration: InputDecoration(
                            suffixIcon: (true)
                                ? IconButton(
                                    icon: const Icon(Icons.close,
                                        size: 24, color: Colors.black),
                                    onPressed: () => {
                                          /*context
                                  .bloc<SearchInputBloc>()
                                  .add(ClearSearchInput()),
                              _searchTextController.clear()*/
                                        })
                                : null,
                            contentPadding: const EdgeInsets.only(left: 2),
                            hintText: 'Search gomart',
                            labelStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            focusColor: Styles.colorGray,
                            fillColor: Styles.colorGray,
                            hoverColor: Styles.colorGray,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          autocorrect: true,
                          onChanged: (value) {},
                          onFieldSubmitted: (value) {
                            if (value.trim().isEmpty) {
                              const snackBar = SnackBar(
                                content: Text('You need to type something to search..'),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResults(
                                    searchTerm: value,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container(
                  height: MediaQuery.of(context).size.height*0.7,
                )),
                const HomeAdMobBanner()
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
