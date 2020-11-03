import 'package:back/screens/write.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        centerTitle: true,
        title: Text(
          'Nimble',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Bunch Blossoms',
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
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'ENTER NAME',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'ENTER EMAIL',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.grey,
              padding: EdgeInsets.only(top: 3, left: 3),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: RoundedRectangleBorder(),
            )
          ],
        ),
      ),
    );
  }
}
