import 'package:flutter/material.dart';
import 'package:back/screens/write_page.dart';
import 'package:back/screens/contacts_page.dart';
import 'package:back/screens/main_drawer.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        WritePage(),
        ContactsPage(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Nimble',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Bunch Blossoms',
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: buildPageView(),
    );
  }
}
