import 'dart:ui';

class PromoteType {
  final String id;
  final String title;
  final String color;
  final String description;
  final List<PromotionPeriod> supportedPeriods;

  PromoteType({
    required this.id,
    required this.title,
    required this.color,
    required this.description,
    required this.supportedPeriods,
  });
}

class PromotionPeriod {
  final String id;
  final String title;
  final int periodInDays;
  final int costAmount;

  PromotionPeriod({
    required this.id,
    required this.title,
    required this.periodInDays,
    required this.costAmount,
  });
}

List<PromoteType> promoteTypeList = [
  PromoteType(
    id: '1',
    title: 'Standard',
    color: '#EDEDED',
    description: 'Your listings will appear in regular searches and recommendations',
    supportedPeriods: [],
  ),
  PromoteType(
    id: '2',
    title: 'Featured',
    color: '#FFC835',
    description: 'Let your ad be on top of the listings',
    supportedPeriods: [
      PromotionPeriod(
        id: '7DAYS',
        title: '7 days',
        periodInDays: 7,
        costAmount: 900,
      ),
      PromotionPeriod(
        id: '14DAYS',
        title: '14 days',
        periodInDays: 4,
        costAmount: 1800,
      ),
      PromotionPeriod(
        id: '1MONTH',
        title: '1 month',
        periodInDays: 20,
        costAmount: 2999,
      ),
    ],
  ),
  PromoteType(
    id: '3',
    title: 'Premium',
    color: '#C3E9D2',
    description: 'Let your ad be on top of listings and shown in home with boosts in recommendation',
    supportedPeriods: [
      PromotionPeriod(
        id: '1MONTH',
        title: '1 month',
        periodInDays: 30,
        costAmount: 4800,
      ),
      PromotionPeriod(
        id: '3MONTH',
        title: '3 months',
        periodInDays: 90,
        costAmount: 6000,
      ),
    ],
  ),
];
Color hexToColor(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('0xFF$hexCode'));
}