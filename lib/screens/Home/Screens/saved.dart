import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gomart/injection.dart';

class SavedFragment extends StatelessWidget {
  const SavedFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:Text('Saved works')
    );
  }
}
