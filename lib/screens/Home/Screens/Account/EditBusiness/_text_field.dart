import 'package:flutter/material.dart';
import 'package:gomart/shared_components/utilities/money_input_formatter.dart';

import '../../../../../styles/styles.dart';

class GomTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final Widget? leadingIcon;
  final bool isTextArea;
  final bool isMoney;
  final bool isCompact;
  final TextInputType? keyboardType;

  const GomTextField({
    super.key,
    this.onChanged,
    this.initialValue = '',
    this.leadingIcon,
    this.isTextArea = false,
    this.keyboardType,
    this.isMoney = false,
    this.isCompact = false,
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
      height: widget.isTextArea ? 100 : 32,
      child: TextField(
          style: widget.isCompact ? const TextStyle(fontSize: 14) : null,
          inputFormatters: widget.isMoney ? [MoneyInputFormatter()] : null,
          keyboardType: widget.keyboardType,
          controller: _textEditingController,
          maxLines: widget.isTextArea ? 6 : null,
          decoration: InputDecoration(
              prefixIcon: widget.leadingIcon,
         enabledBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Styles.colorTextFieldBorder,  width: 0.8,),
         ),
              focusedBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Styles.colorPrimary,  width: 0.8,),
         ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.isTextArea
                      ? 8
                      : widget.isCompact
                          ? 2
                          : 0,
                  horizontal: 8),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
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
