
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gomart/shared_components/postSpecifications/specifications.dart';
import 'package:gomart/styles/styles.dart';

class ChooseSpecificationTemplate extends StatefulWidget {
  final Function(SpecificationsTemplateModel template)? onTemplateSelect;

  const ChooseSpecificationTemplate({
    super.key,
    this.onTemplateSelect,
  });

  @override
  State<ChooseSpecificationTemplate> createState() =>
      _ChooseSpecificationTemplateState();
}

class _ChooseSpecificationTemplateState
    extends State<ChooseSpecificationTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Open dropdown on text click
            // Show the PopupMenu on tap
            showPopupMenu(context);
          },
          child: const Text(
            'Choose from template',
            style: TextStyle(
                color: Styles.colorPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
      ],
    );
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(button.size.bottomLeft(Offset.zero),
            ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: List.generate(
          specTemplates.length,
              (index) => PopupMenuItem(
            value: specTemplates[index],
            child: Text(specTemplates[index].templateName),
          )),
      elevation: 8,
    ).then((SpecificationsTemplateModel? value) {
      if (value != null) {
        widget.onTemplateSelect!(value);
        // Handle the selected option
      }
    });
  }
}
