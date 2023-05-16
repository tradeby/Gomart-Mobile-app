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
  'Display Size/Resolution',
  'Processor Type/Speed',
  'RAM/Storage Capacity',
  'Graphics Performance',
  'Battery Life',
  'Operating System Compatibility',
  'Keyboard and Touchpad Quality',
  'Ports and Connectivity Options',
  'Weight/Portability',
  'Security Features (e.g., Fingerprint, TPM)',
];

List<String> food = [
  'Flavor Options',
  'Size/Portion Guide',
  'Dietary Restrictions (e.g., Gluten-free, Vegan)',
  'Decoration Style/Theme',
  'Icing/Frosting Choices',
  'Filling Options',
  'Customization/Personalization',
  'Delivery/Pickup Options',
  'Shelf Life/Freshness',
  'Allergen Information,',
];

List<String> mensClothingSpecifications = [
  'Size/Measurement Guide',
  'Fabric Material/Composition',
  'Color Options',
  'Style/Design Details',
  'Fit (e.g., Slim Fit, Regular Fit)',
  'Care Instructions',
  'Seasonal Suitability',
  'Available Accessories',
  'Country/Region of Manufacture',
  'Sustainable/Eco-Friendly Attributes',
];

List<String> womensClothingSpecifications = [
  'Size/Measurement Guide',
  'Fabric Material/Composition',
  'Color Options',
  'Neckline Style',
  'Dress Length',
  'Sleeve Type',
  'Closure Type',
  'Fit (e.g., Regular Fit, Loose Fit)',
  'Care Instructions',
  'Country/Region of Manufacture',
];

List<String> phoneSpecifications = [
  'Screen Size/Resolution',
  'Camera Quality/Features',
  'Battery Life/Charging Speed',
  'Processor Speed',
  'Storage Capacity/RAM',
  'Operating System Version',
  'Connectivity (e.g., 5G, Wi-Fi, Bluetooth)',
  'Water and Dust Resistance',
  'Biometric Security (e.g., Fingerprint, Face Unlock)',
  'Dimensions/Weight',
];
