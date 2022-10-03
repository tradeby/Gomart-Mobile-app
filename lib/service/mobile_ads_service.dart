import 'package:google_mobile_ads/google_mobile_ads.dart';

class MobileAdsService{
  static MobileAdsService init() {
    MobileAds.instance.initialize();
    return MobileAdsService();
  }
}