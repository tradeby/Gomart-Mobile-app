import 'package:flutter/material.dart';
import 'package:gomart/shared_components/postSpecifications/specifications.dart';
import 'package:gomart/styles/styles.dart';

import '_add_new_spec_section.dart';
import '_choose_specification_template.dart';
import '_spec_item_model.dart';
import '_specification_item.dart';

class SpecificationsSection extends StatefulWidget {
  const SpecificationsSection({
    super.key,
  });

  @override
  State<SpecificationsSection> createState() => _SpecificationsSectionState();
}
class _SpecificationsSectionState extends State<SpecificationsSection> {
  List<SpecItemModel> specItems = [];
  int lastItemCount = 0;

  _onTemplateSelect(SpecificationsTemplateModel template) {
    List<SpecItemModel> newSpecs = template.specifications
        .asMap()
        .map((index, item) {
      return MapEntry(
          index,
          SpecItemModel(
              id: 'k_${index}_$lastItemCount', specItemTitle: item));
    })
        .values
        .toList();

    setState(() {
      specItems = [];
    });
    setState(() {
      specItems = newSpecs;
    });
  }

  _onItemRemove(String id) {
    setState(() {
      specItems = specItems.where((element) => element.id != id).toList();
    });
  }

  _onAddNewSpec(String title, String value) {
    setState(() {
      specItems = specItems +
          [
            SpecItemModel(
                id: 'b_$lastItemCount',
                specItemTitle: title,
                specItemValue: value)
          ];
      lastItemCount = lastItemCount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Specifications',
            style: TextStyle(
                color: Styles.colorTextBlack,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const Padding(
            padding: EdgeInsets.all(4),
          ),
          ChooseSpecificationTemplate(
            onTemplateSelect: _onTemplateSelect,
          ),
          Column(
            children: List.generate(
                specItems.length,
                    (index) => SpecificationItem(
                  key: Key('$index+${specItems[index].specItemTitle}'),
                  title: specItems[index].specItemTitle,
                  value: specItems[index].specItemValue,
                  id: specItems[index].id,
                  onRemoveItem: _onItemRemove,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          AddNewSpecSection(onAddSpec: _onAddNewSpec),
        ],
      ),
    );
  }
}
