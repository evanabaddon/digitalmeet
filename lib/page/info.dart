import 'package:digitalmeet/conf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Conf().primaryColor,
        centerTitle: true,
        toolbarHeight: 60,
        title: Text('Info',
            style: TextStyle(
                fontSize: 20, fontFamily: GoogleFonts.poppins().fontFamily)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              Text(
                "Jagongan Online",
                style: Conf().titleStyle.copyWith(color: Conf().primaryColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'This app is made by Digitaloka @ 2022',
                style: Conf().textStyle.copyWith(fontWeight: FontWeight.normal),
              ),
              Text(
                'More information about us, please contact below',
                style: Conf().textStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Conf().primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "digitaloka@gmail.com",
                    style:
                        Conf().textStyle.copyWith(color: Conf().primaryColor),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const BannerAd(
                size: BannerSize.ADAPTIVE,
              )
            ],
          ),
        ),
      ),
    );
  }
}
