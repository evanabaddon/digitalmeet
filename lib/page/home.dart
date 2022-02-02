import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digitalmeet/conf.dart';
import 'package:digitalmeet/page/create.dart';
import 'package:digitalmeet/page/info.dart';
import 'package:digitalmeet/page/join.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  bool isLoading = false;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List pages = [
    MyRoute(
      iconData: Icons.compare_arrows,
      page: const JoinPage(),
      text: 'Join',
    ),
    MyRoute(
      iconData: Icons.add,
      page: const CreatePage(),
      text: 'Create',
    ),
  ];
  loadData() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoPage(),
                  ),
                );
              },
            ),
          ],
          backgroundColor: Conf().primaryColor,
          centerTitle: true,
          toolbarHeight: 60,
          title: Image.asset('assets/images/jagool.png', height: 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Conf().primaryColor,
          buttonBackgroundColor: Conf().primaryColor,
          backgroundColor: Colors.white,
          key: _bottomNavigationKey,
          items: pages
              .map((p) => Icon(
                    p.iconData,
                    semanticLabel: p?.text,
                    size: 30,
                    color: Colors.white,
                  ))
              .toList(),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
          child: pages[_pageIndex].page,
        ));
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;
  final String text;

  MyRoute({required this.iconData, required this.page, required this.text});
}
