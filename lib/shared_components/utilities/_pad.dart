import 'package:flutter/material.dart';

class Pad extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const Pad({super.key, required this.child, this.padding = const EdgeInsets.all(8.0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
