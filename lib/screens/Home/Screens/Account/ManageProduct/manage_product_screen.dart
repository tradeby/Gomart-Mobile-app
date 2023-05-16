import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gomart/shared_components/imageAddPreview/image_add_preview.dart';

import '../../../../../shared_components/postSpecifications/specifications.dart';
import '../../../../../shared_components/supportedOpeningClosingTimes/_supported_times.dart';
import '../../../../../styles/custom_home_icons.dart';
import '../../../../../styles/styles.dart';
import '../BusinessProfile/business_profile_screen.dart';
import '../EditBusiness/_text_field.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                child: SizedBox(
                  height: 25,
                  width: 80,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Styles.colorGray,
                          style: BorderStyle.solid,
                          width: 1,
                        )),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Styles.colorTextBlack.withOpacity(0.8),
                          fontSize: 11),
                    ),
                  ),
                ),
              ),
              const StoreGallerySection(),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ad title',
                      style: TextStyle(
                        color: Styles.colorGray,
                        fontSize: 15,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    GomTextField()
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Styles.colorGray,
                        fontSize: 15,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    GomTextField(isTextArea: true)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        color: Styles.colorGray,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    GomTextField(
                        leadingIcon: Container(
                          margin: const EdgeInsets.fromLTRB(1, 1, 6, 1),
                          decoration: const BoxDecoration(
                            color: Styles.colorButtonPay,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          width: 0,
                          child: const Center(
                            child: Text(
                              '₦',
                              style: TextStyle(
                                  color: Styles.colorTextBlack,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        isMoney: true)
                    /* Stack(
                      children: [
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Styles.colorTextFieldBorder,
                              width: 0.8,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        Positioned(
                          top: 1.3,
                          left: 1.2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Styles.colorButtonPay,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            height: 30,
                            width: 37,
                            child: const Center(
                              child: Text(
                                '₦',
                                style: TextStyle(
                                    color: Styles.colorTextBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    )*/
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(6.0),
              ),
              const SpecificationsSection(),
              const Padding(padding: EdgeInsets.all(6)),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Promote your Ad',
                      style: TextStyle(
                        color: Styles.colorGray,
                        fontSize: 15,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Styles.colorGray.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text('Standard'),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          const Text(
                            'Free',
                            style: TextStyle(
                                color: Styles.colorPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(4)),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Styles.colorSecondary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: const Text('Featured'),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              const Text(
                                'N9,000',
                                style: TextStyle(color: Styles.colorPrimary),
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'Let your ad be on top of the listings',
                                  style: TextStyle(
                                      color: Styles.colorGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: const BoxDecoration(
                                      color: Styles.colorButtonPay,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: const Text(
                                      '7 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '14 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '30 days',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Styles.colorTextFieldBorder,
                          width: 0.8,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.circle_outlined,
                            color: Styles.colorPrimary,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: const BoxDecoration(
                                  color: Styles.colorPromoteAdsPremium,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: const Text('Premium'),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              const Text(
                                'N2,999',
                                style: TextStyle(color: Styles.colorPrimary),
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Text(
                                  'Have your Ad on home and suggested on similar post',
                                  style: TextStyle(
                                      color: Styles.colorGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(4)),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: const BoxDecoration(
                                      color: Styles.colorButtonPay,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: const Text(
                                      '1 month',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Styles.colorPrimary,
                                        width: 0.8,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: const Text(
                                      '3 months',
                                      style:
                                          TextStyle(color: Styles.colorPrimary),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Styles.colorSecondary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 80),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BusinessProfileScreen()),
                            );
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Styles.colorBlack),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(12))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecificationsSection extends StatefulWidget {
  const SpecificationsSection({
    super.key,
  });

  @override
  State<SpecificationsSection> createState() => _SpecificationsSectionState();
}

class SpecItemModel {
  final String id;
  final String? specItemTitle;
  final String? specItemValue;

  const SpecItemModel(
      {required this.id, this.specItemTitle, this.specItemValue});
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
            'Choose a specification template',
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
