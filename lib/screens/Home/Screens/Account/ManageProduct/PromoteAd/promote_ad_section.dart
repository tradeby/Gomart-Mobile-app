import 'package:flutter/material.dart';
import 'package:gomart/screens/Home/Screens/Account/ManageProduct/PromoteAd/promote_type.dart';
import 'package:gomart/shared_components/utilities/formart_to_currency_naira.dart';
import 'package:gomart/styles/styles.dart';
import 'package:injectable/injectable.dart';

class PromoteAdSection extends StatefulWidget {
  const PromoteAdSection({
    super.key,
  });

  @override
  State<PromoteAdSection> createState() => _PromoteAdSectionState();
}

class _PromoteAdSectionState extends State<PromoteAdSection> {
  PromoteType? selectedPromoteItem;
  PromotionPeriod? selectedPeriod;
  _onPromoteItemSelected(PromoteType promoteItem, PromotionPeriod? period){
    setState(() {
      selectedPromoteItem = promoteItem;
      selectedPeriod = period;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Promote your product/Service',
            style: TextStyle(
              color: Styles.colorGray,
              fontSize: 15,
            ),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Column(
              children: List.generate(
                  promoteTypeList.length,
                  (index) => PromoteAdListItem(
                        onPromoteItemSelected: _onPromoteItemSelected,
                        isPromoteItemSelected: selectedPromoteItem?.id == promoteTypeList[index].id,
                        promoteItemModel: promoteTypeList[index],
                      ))),
        ],
      ),
    );
  }
}

class PromoteAdListItem extends StatefulWidget {
  final PromoteType promoteItemModel;
  final bool isPromoteItemSelected;
  final Function(PromoteType promoteItem, PromotionPeriod? period)
      onPromoteItemSelected;

  const PromoteAdListItem({
    super.key,
    required this.promoteItemModel,
    required this.isPromoteItemSelected,
    required this.onPromoteItemSelected,
  });

  @override
  State<PromoteAdListItem> createState() => _PromoteAdListItemState();
}

class _PromoteAdListItemState extends State<PromoteAdListItem> {
  PromotionPeriod? selectedPeriod;

  _onSelectedPeriodChange(PromotionPeriod sPeriod) {
    setState(() {
      selectedPeriod = sPeriod;
    });
    widget.onPromoteItemSelected(widget.promoteItemModel, sPeriod);
  }

  _onTap() {
    if (widget.promoteItemModel.supportedPeriods.isEmpty) {
      widget.onPromoteItemSelected(widget.promoteItemModel, null);
    } else {
      widget.onPromoteItemSelected(widget.promoteItemModel, selectedPeriod);
    }
  }

  @override
  void initState() {
    if (widget.promoteItemModel.supportedPeriods.isNotEmpty) {
      setState(() {
        selectedPeriod = widget.promoteItemModel.supportedPeriods[0];
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: widget.isPromoteItemSelected?const Color(0xfffafafa):null,
        border: Border.all(
          color: Styles.colorTextFieldBorder,
          width: 0.8,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _onTap,
            child:  Icon(
              widget.isPromoteItemSelected?Icons.circle:  Icons.circle_outlined,
              color: widget.isPromoteItemSelected?Styles.colorPrimary: Styles.colorGray,
              size: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          GestureDetector(
            onTap: _onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: hexToColor(widget.promoteItemModel.color),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(widget.promoteItemModel.title),
                ),
                const Padding(padding: EdgeInsets.all(4)),
                Text(
                  widget.promoteItemModel.supportedPeriods.isEmpty
                      ? 'Free'
                      : (selectedPeriod == null)
                          ? 'Select period'
                          : formatToNairaCurrency(selectedPeriod!.costAmount),
                  style: const TextStyle(color: Styles.colorPrimary),
                )
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  widget.promoteItemModel.description,
                  style: const TextStyle(
                      color: Styles.colorGray,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              Row(
                children: List.generate(
                    widget.promoteItemModel.supportedPeriods.length,
                    (index) => PromotePeriodItem(
                        onPeriodChange: _onSelectedPeriodChange,
                        period: widget.promoteItemModel.supportedPeriods[index],
                        isSelected: selectedPeriod?.id ==
                            widget
                                .promoteItemModel.supportedPeriods[index].id)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromotePeriodItem extends StatefulWidget {
  final PromotionPeriod period;
  final bool isSelected;
  final Function(PromotionPeriod selectePeriod) onPeriodChange;

  const PromotePeriodItem({
    super.key,
    required this.period,
    required this.isSelected,
    required this.onPeriodChange,
  });

  @override
  State<PromotePeriodItem> createState() => _PromotePeriodItemState();
}

class _PromotePeriodItemState extends State<PromotePeriodItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPeriodChange(widget.period),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                widget.isSelected ? Styles.colorButtonPay : Styles.colorPrimary,
            width: 0.8,
          ),
          color: widget.isSelected ? Styles.colorButtonPay : null,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          widget.period.title,
          style: const TextStyle(color: Styles.colorPrimary),
        ),
      ),
    );
  }
}
