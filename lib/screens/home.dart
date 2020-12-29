import 'package:flutter/material.dart';
import 'package:back/screens/write_page.dart';
import 'package:back/screens/contacts_page.dart';
import 'package:back/screens/main_drawer.dart';
import 'contacts_page.dart';

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
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          'Nimble',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Bunch Blossoms',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ContactsPage.id);
              },
              child: Icon(
                Icons.contact_page_outlined,
                size: 26.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: buildPageView(),
    );
  }
}
