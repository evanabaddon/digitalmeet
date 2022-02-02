import 'dart:io';
import 'package:digitalmeet/conf.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

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

  joinmeeting() async {
    try {
      Map<FeatureFlagEnum, bool> feautureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false
      };
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

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          LottieBuilder.asset(
            'assets/lottie/meeting.json',
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
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
                  onPressed: () {
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
