import 'package:back/screens/home.dart';
import 'package:back/screens/write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Information extends StatefulWidget {
  static String id = 'info';
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home_filled),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
        centerTitle: true,
        title: Text(
          'Edit your profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            // fontFamily: 'Bunch Blossoms',
          ),
        ),
        actions: [FlatButton(onPressed: null, child: null)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blueGrey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'ENTER NAME',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'ENTER EMAIL',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(30),
                child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.black,
                      padding: EdgeInsets.only(top: 3, left: 3),
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
