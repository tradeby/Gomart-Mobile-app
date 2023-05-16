
import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/Account/EditBusiness/_text_field.dart';
import 'package:gomart/styles/styles.dart';

class SpecificationItem extends StatelessWidget {
  final String id;
  final String? title;
  final String? value;
  final Function(String id)? onRemoveItem;

  const SpecificationItem(
      {super.key, this.title, this.value, required this.id, this.onRemoveItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(4)),
                  GomTextField(
                    initialValue: title,
                    isCompact: true,
                  ),
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.41,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(4)),
                GomTextField(key: Key(id+value.toString()), initialValue: value, isCompact: true),
              ],
            ),
          ),
          IconButton(
            color: Styles.colorWhite,
            icon: Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child:
                const Icon(Icons.remove_circle, color: Colors.redAccent)),
            onPressed: () => onRemoveItem!(id),
          )
        ],
      ),
    );
  }
}
