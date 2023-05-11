import 'package:flutter/material.dart';

class VerticalPad extends StatelessWidget {
  final Widget child;
  final double padding;

  const VerticalPad({super.key, required this.child, this.padding = 8.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}
