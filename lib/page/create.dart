import 'package:digitalmeet/conf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String code = '';
  createCode() {
    setState(() {
      code = const Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          LottieBuilder.asset('assets/lottie/info.json',
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Buat Ruang Jagongan',
              style: Conf().titleStyle,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Tekan tombol "Buat Kode" dibawah ini',
            textAlign: TextAlign.center,
            style: Conf().textStyle,
          ),
          Text(
            "untuk membuat kode ruangan baru",
            textAlign: TextAlign.center,
            style: Conf().textStyle,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              height: 50,
              width: 200,
              child: Center(
                child: Text(
                  code,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  createCode();
                },
                child: const Text(
                  'Buat Kode',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Conf().primaryColor,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                },
                child: const Text(
                  'Salin Kode',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Conf().primaryColor,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
