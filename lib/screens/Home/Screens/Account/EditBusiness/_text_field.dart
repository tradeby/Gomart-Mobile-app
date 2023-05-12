import 'package:flutter/material.dart';

import '../../../../../styles/styles.dart';

class GomTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;

  const GomTextField({
    super.key,
    this.onChanged,
    this.initialValue = '',
  });

  @override
  State<StatefulWidget> createState() => _GomTextFieldState();
}

class _GomTextFieldState extends State<GomTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
          controller: _textEditingController,
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
          onChanged: widget.onChanged),
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
