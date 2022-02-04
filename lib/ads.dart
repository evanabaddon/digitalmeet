import 'package:flutter/foundation.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

String get nativeAdUnitId {
  /// Always test with test ads
  /// TODO: Change to real ad unit id
  if (kDebugMode) {
    return MobileAds.nativeAdTestUnitId;
  } else {
    return 'your-native-ad-unit-id';
  }
}

String get bannerAdUnitId {
  /// Always test with test ads
  /// TODO: Change to real ad unit id
  if (kDebugMode) {
    return MobileAds.bannerAdTestUnitId;
  } else {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
}

String get interstitialAdUnitId {
  /// Always test with test ads
  /// TODO: Change to real ad unit id
  if (kDebugMode) {
    return MobileAds.interstitialAdTestUnitId;
  } else {
    return 'ca-app-pub-3940256099942544/1033173712';
  }
}

String get rewardedAdUnitId {
  /// Always test with test ads
  /// TODO: Change to real ad unit id
  if (kDebugMode) {
    return MobileAds.rewardedAdTestUnitId;
  } else {
    return 'you-interstitial-ad-unit-id';
  }
}

String get appOpenAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.appOpenAdTestUnitId;
  } else {
    return 'ca-app-pub-3940256099942544/3419835294';
  }
}

String get rewardedInterstitialAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.rewardedInterstitialAdTestUnitId;
  } else {
    return 'you-interstitial-ad-unit-id';
  }
}
