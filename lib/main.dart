import 'package:digitalmeet/ads.dart';
import 'package:digitalmeet/page/home.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

void main() async {
  await initAds();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Theme(
        data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
        ),
        child: const HomePage(),
      ),
      color: Colors.white,
    );
  }
}

Future<void> initAds() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.initialize(
    nativeAdUnitId: nativeAdUnitId,
    bannerAdUnitId: bannerAdUnitId,
    interstitialAdUnitId: interstitialAdUnitId,
    rewardedAdUnitId: rewardedAdUnitId,
    appOpenAdUnitId: appOpenAdUnitId,
    rewardedInterstitialAdUnitId: rewardedInterstitialAdUnitId,
  );
}
