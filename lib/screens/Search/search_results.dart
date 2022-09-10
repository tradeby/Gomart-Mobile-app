import 'package:flutter/material.dart';
import 'dart:math';
import '../../styles/styles.dart';
import '../Home/Screens/home_Fragment.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
                floating: true, delegate: SearchPersistentHeader()),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: SampleProducts.listOfProducts.length,
                  (BuildContext context, int index) {
                return SampleProducts.listOfProducts[index];
              }),
            )
          ]),
        ),
      ),
    );
  }
}

class SearchPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Styles.colorFiltersBackground,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [BackButton(), Text('Auto Repairs')],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.close))
            ],
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Container(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.filter_list_sharp),
                      Text(
                        'Filters',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.rotate(
                          angle: pi / 12.0,
                          child: const Icon(Icons.compare_arrows)),
                      const Text(
                        'Sorting',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 95;

  @override
  double get minExtent => 95;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
