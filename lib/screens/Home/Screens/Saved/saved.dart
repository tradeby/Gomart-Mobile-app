import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomart/injection.dart';

import '../../../../styles/styles.dart';
import '../Home/home.dart';

class SavedFragment extends StatefulWidget {
  const SavedFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StateSavedFragment();
}

class StateSavedFragment extends State<SavedFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Styles.colorWhite,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          backgroundColor: Styles.colorBackground,
          title: const TabBar(
            padding: EdgeInsets.symmetric(
              vertical: 200,
            ),
            labelStyle: TextStyle(fontSize: 12),
            tabs: [

              Tab(
                icon: Icon(Icons.favorite_border_outlined),
                text: 'Saved items',
              ),
              Tab(
                icon: Icon(Icons.domain),
                text: 'Businesses',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'Recently viewed',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          SavedItemsTab(),
          BusinessesTab(),

          RecentlyViewedTab(),
        ]),
      ),
    );
  }
}

class RecentlyViewedTab extends StatelessWidget {
  const RecentlyViewedTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (item, count)=>
                  ProductCard(product: SampleProducts.listOfProducts[count+0],)),
        ),
      ) ,
    );
  }
}

class SavedItemsTab extends StatelessWidget {
  const SavedItemsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (item, count)=>
               ProductCard(product: SampleProducts.listOfProducts[count],)),
        ),
      ) ,
    );
  }
}

class BusinessesTab extends StatelessWidget {
  const BusinessesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (item, count)=>
              const BusinessListItem()),
        ),
      ) ,
    );
  }
}

class BusinessListItem extends StatelessWidget {
  const BusinessListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Styles.colorWhite,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/gomart-apps.appspot.com/o/product-detail%2FbusinessLogo.png?alt=media&token=128b8d3c-ce25-4a78-b769-fa92c3d6c014'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(60),
                  color: Styles.colorGray),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Container(
              color: Styles.colorWhite,
              width: MediaQuery.of(context).size.width * 0.762,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('3ple F Bakers'),
                      /*Row(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.star,
                                  size: 12,
                                  color: Styles.colorSecondary),
                              Icon(Icons.star,
                                  size: 12,
                                  color: Styles.colorSecondary),
                              Icon(Icons.star,
                                  size: 12,
                                  color: Styles.colorSecondary),
                              Icon(Icons.star,
                                  size: 12,
                                  color: Styles.colorSecondary),
                              Icon(Icons.star,
                                  size: 12,
                                  color: Styles.colorSecondary),
                            ],
                          ),
                          const Text(
                            '(52 Reviews)',
                            style: TextStyle(
                                color: Styles.colorPrimary,
                                fontSize: 12),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  const Text(
                    'No. 885 Darmanawa Tudun Fulani',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  const Text(
                    'Darmanawa, Kano',
                    style: TextStyle(
                        fontSize: 12, color: Styles.colorPrimary),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                         /* Text(
                            'Hours: Open . Closes 5pm',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),*/
                          Padding(padding: EdgeInsets.all(2)),
                          Text(
                            'Members since August 2022',
                            style: TextStyle(
                                fontSize: 12,
                                color: Styles.colorGray),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         /* const Text(
                            '1,121 Followers',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),*/
                          const Padding(padding: EdgeInsets.all(2)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Styles.colorButtonGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Following',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Styles.colorBlack),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                ],
              ),
            )
          ],
        ));
  }
}

