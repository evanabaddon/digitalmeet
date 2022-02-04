import 'dart:io';
import 'package:digitalmeet/conf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:lottie/lottie.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:shimmer/shimmer.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool? isVideoMuted = true;
  bool? isAudioMuted = true;

  AppOpenAd appOpenAd = AppOpenAd()..load();

  joinmeeting() async {
    try {
      Map<FeatureFlagEnum, bool> feautureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
        FeatureFlagEnum.INVITE_ENABLED: false,
        FeatureFlagEnum.CALL_INTEGRATION_ENABLED: false,
      };
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      if (Platform.isAndroid) {
        feautureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        feautureflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: roomcontroller.text)
        ..userDisplayName = namecontroller.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(feautureflags);
      featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  // lottie
  late final Future<LottieComposition> _joincomposition;
  @override
  void initState() {
    super.initState();

    _joincomposition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/lottie/info.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: FutureBuilder<LottieComposition>(
              future: _joincomposition,
              builder: (context, snapshot) {
                var composition = snapshot.data;
                if (composition != null) {
                  return Lottie(composition: composition);
                } else {
                  return Center(
                    child: Center(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Lottie.asset(
                            'assets/lottie/meeting.json',
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Gabung Jagongan',
              style: Conf().titleStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                  controller: roomcontroller,
                  decoration: InputDecoration(
                    focusColor: Conf().primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Conf().primaryColor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Kode Ruangan',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Conf().primaryColor),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: const Icon(Icons.perm_identity),
                    hintText: 'Inisial Anda',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Conf().primaryColor,
                  value: isVideoMuted,
                  onChanged: (value) {
                    setState(() {
                      isVideoMuted = value;
                    });
                  },
                  title: const Text(
                    "Matikan Video",
                  ),
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Conf().primaryColor,
                  value: isAudioMuted,
                  onChanged: (value) {
                    setState(() {
                      isAudioMuted = value;
                    });
                  },
                  title: const Text(
                    "Matikan Audio",
                  ),
                ),
                const Text(
                  "Tenang, kamu dapat mengubah pengaturan ini di dalam ruangan",
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  height: 48,
                  thickness: 2.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    primary: Conf().primaryColor,
                  ),
                  onPressed: () async {
                    (!appOpenAd.isAvailable);
                    await appOpenAd.load();
                    if (appOpenAd.isAvailable) {
                      await appOpenAd.show();
                      // Load a new ad right after the other one was closed
                      appOpenAd.load();
                    }
                    joinmeeting();
                  },
                  child: const Text(
                    'Gabung Jagongan',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
