
import 'package:flutter/material.dart';

import '../../../../../styles/styles.dart';

class BTextField extends StatelessWidget {
  const BTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
        decoration: const InputDecoration(
            focusColor: Styles.colorGray,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.colorTextFieldBorder,
                  width: 0.8,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)))),
        onChanged: (value) {
          // do something
        },
      ),
    );

    /*    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
          color: Styles.colorTextFieldBorder,
          width: 0.8,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );*/
  }
}
