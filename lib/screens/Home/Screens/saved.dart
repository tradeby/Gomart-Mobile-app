import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomart/injection.dart';

class SavedFragment extends StatelessWidget {
  const SavedFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: locator<FirebaseFirestore>().collection('PRODUCTS').get(), // async work
        builder: (BuildContext context,snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return const Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(
                  child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                    return Text('hello ${snapshot.data?.docs[index].id}');
                  }),
                );
              }
          }
        },
      ),
    );
  }
}
