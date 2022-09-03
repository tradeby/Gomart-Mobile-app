class FlagCountryCodeModel {
  final String id;
  final String countryName;
  final String countryCode;
  final String flag;

  const FlagCountryCodeModel(
      {required this.id,
      required this.countryName,
      required this.countryCode,
      required this.flag});

  static List<FlagCountryCodeModel> getSupportedList = [
    const FlagCountryCodeModel(
        id: 'NG',
        countryName: 'Nigeria',
        countryCode: '+234',
        flag: 'assets/flags/ng.png'),
    const FlagCountryCodeModel(
        id: 'GB',
        countryName: 'United Kingdom',
        countryCode: '+44',
        flag: 'assets/flags/gb.png'),
  ];
}
