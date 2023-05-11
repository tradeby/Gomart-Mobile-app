
import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

class GetCurrentLocation extends StatelessWidget {
  const GetCurrentLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      color: Styles.colorWhite,
      child: const Text(
        'Use my current location as my address',
        style: TextStyle(fontSize: 14, color: Styles.colorPrimary),
      ),
    );
  }
}
