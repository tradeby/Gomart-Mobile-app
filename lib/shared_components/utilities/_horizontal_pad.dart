import 'package:flutter/material.dart';

class HorizontalPad extends StatelessWidget {
  final Widget child;
  final double padding;

  const HorizontalPad({super.key, required this.child, this.padding = 8.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }
}
