import 'package:flutter/material.dart';
import 'package:gomart/styles/styles.dart';

import '../../EditBusiness/_text_field.dart';

class AddNewSpecSection extends StatefulWidget {
  final Function(String title, String value)? onAddSpec;

  const AddNewSpecSection({
    super.key,
    this.onAddSpec,
  });

  @override
  State<AddNewSpecSection> createState() => _AddNewSpecSectionState();
}

class _AddNewSpecSectionState extends State<AddNewSpecSection> {
  String title = '';
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(color: Styles.colorTextBlack),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              GomTextField(
                key: const Key('title'),
                initialValue: title,
                isCompact: true,
                onChanged: (value) => setState(() {
                  title = value;
                }),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(4)),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Value',
                style: TextStyle(color: Styles.colorTextBlack),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              GomTextField(
                key: const Key('value'),
                initialValue: value,
                isCompact: true,
                onChanged: (val) => setState(() {
                  value = val;
                }),
              ),
            ],
          ),
        ),
        IconButton(
          color: Styles.colorWhite,
          icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: const Icon(Icons.add_circle_sharp,
                  color: Styles.colorPrimary)),
          onPressed: () {
            widget.onAddSpec!(title, value);
          },
        )
      ],
    );
  }
}
