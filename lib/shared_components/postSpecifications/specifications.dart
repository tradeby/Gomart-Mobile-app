class SpecificationsTemplateModel {
  final String templateName;
  final List<String> specifications;

  const SpecificationsTemplateModel(
      {required this.templateName, required this.specifications});
}

List<SpecificationsTemplateModel> specTemplates = [
  SpecificationsTemplateModel(
      templateName: 'Phones', specifications: phoneSpecifications),
  SpecificationsTemplateModel(
      templateName: 'Laptop', specifications: laptopSpecifications),
  SpecificationsTemplateModel(
      templateName: 'Men\'s Clothing',
      specifications: mensClothingSpecifications),
  SpecificationsTemplateModel(
      templateName: 'Women\'s Clothing',
      specifications: womensClothingSpecifications),
  SpecificationsTemplateModel(
      templateName: 'Food & Diet', specifications: food),
];
List<String> laptopSpecifications = [
  'Display Size',
  'Resolution',
  'Processor Type',
  'Speed',
  'RAM',
  'Storage Capacity',
  'Graphics Performance',
  'Battery Life',
  'Operating System',
  'Keyboard',
  'Touchpad Quality',
  'Ports',
  'Weight',
  'Portability',
  'Security Features',
];

List<String> food = [
  'Flavor Options',
  'Size',
  'Portion Guide',
  'Dietary Restrictions',
  'Decoration Style',
  'Theme',
  'Filling Options',
  'Customization',
  'Delivery',
  'Pickup Options',
  'Shelf Life',
  'Freshness',
  'Allergen Information,',
];

List<String> mensClothingSpecifications = [
  'Sizes',
  'Measurement Guide',
  'Fabric Material',
  'Composition',
  'Color Options',
  'Style',
  'Design Details',
  'Fit',
  'Care Instructions',
  'Seasonal Suitability',
  'Available Accessories',
  'Country of Manufacture',
  'Eco-Friendly Attributes',
];

List<String> womensClothingSpecifications = [
  'Size',
  'Measurement Guide',
  'Fabric Material',
  'Composition',
  'Color Options',
  'Neckline Style',
  'Dress Length',
  'Sleeve Type',
  'Closure Type',
  'Fit',
  'Care Instructions',
  'Country/Region of Manufacture',
];

List<String> phoneSpecifications = [
  'Screen Size',
  'Resolution',
  'Camera Quality',
  'Battery Life',
  'Charging Speed',
  'Processor Speed',
  'Storage Capacity',
  'RAM',
  'OS Version',
  'Connectivity',
  'Water Resistance',
  'Biometric Security',
  'Dimensions',
  'Weight',
];
