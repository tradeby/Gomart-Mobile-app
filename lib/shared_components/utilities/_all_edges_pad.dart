import 'package:flutter/material.dart';

class AllEdgesPad extends StatelessWidget {
  final Widget child;
  final double padding;

  const AllEdgesPad({super.key, required this.child, this.padding = 8.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
