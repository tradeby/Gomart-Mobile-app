import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomart/screens/Search/bloc/bloc.dart';
import 'package:gomart/shared_components/fade_in_page_route.dart';
import 'package:gomart/styles/custom_home_icons.dart';
import 'dart:math';
import '../../styles/styles.dart';
import '../Home/Screens/HomeFragment/home_Fragment.dart';
import 'search_input.dart';

class SearchResults extends StatelessWidget {
  final String searchTerm;

  const SearchResults({Key? key, required this.searchTerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().searchByQuery(searchTerm);
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
                floating: true, delegate: SearchPersistentHeader(searchTerm)),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.searchInProgress) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: 3,
                        (BuildContext context, int index) {
                      return const ProductCardLoading();
                    }),
                  );
                } else if (state.searchSuccess) {
                  if( state.searchResults.isEmpty ){
                    return SliverList(
                        delegate: SliverChildListDelegate([
                          const Center(
                            child: Text('No results'),
                          ),
                        ]));
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.searchResults.length,
                        (BuildContext context, int index) {
                      return ProductCard(
                        product: SampleProducts.toProductModel(
                          state.searchResults[index],
                        ),
                      );
                    }),
                  );
                } else {
                  return SliverList(
                      delegate: SliverChildListDelegate([
                    const Center(
                      child: Text('Error encountered loading products'),
                    ),
                  ]));
                }
              },
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  const HomeAdMobBanner()
                ]))
          ]),
        ),
      ),
    );
  }
}

class SearchPersistentHeader extends SliverPersistentHeaderDelegate {
  final String searchTerm;

  SearchPersistentHeader(this.searchTerm);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Styles.colorWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute(const SearchInputScreen()));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      color: Styles.colorBackground,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(searchTerm),
                      const Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              color: Styles.colorWhite,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Padding(padding: EdgeInsets.all(25)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20)),
                                      Text(
                                        'Filter',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('Clear All'),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(18)),
                                  const Text('Services'),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        FilterListItem(
                                          label: 'Computer Priting',
                                          isChecked: false,
                                        ),
                                        FilterListItem(
                                          label: 'Bakery & Catering',
                                          isChecked: true,
                                        ),
                                        FilterListItem(
                                          label: 'Auto-repair & servicing',
                                          isChecked: false,
                                        ),
                                        FilterListItem(
                                          label: 'Wedding planning',
                                          isChecked: false,
                                        ),
                                        FilterListItem(
                                          label: 'Vegetable Suppliers',
                                          isChecked: true,
                                        ),
                                        FilterListItem(
                                          label: 'Laptop wholesale',
                                          isChecked: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(25)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Styles.colorSecondary,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 40),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'Apply',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Styles.colorBlack),
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(25)),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 20,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Styles.colorBarBottomSheet,
                                    ),
                                    height: 5,
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 20,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 24,
                                  ),
                                )),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Gomart.filterOutline))
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterListItem extends StatelessWidget {
  final String label;
  final bool isChecked;

  const FilterListItem({
    Key? key,
    required this.label,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Checkbox(
            checkColor: Styles.colorWhite,
            fillColor: MaterialStateProperty.all(Styles.colorBlack),
            value: isChecked,
            onChanged: (value) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          )
        ],
      ),
    );
  }
}
