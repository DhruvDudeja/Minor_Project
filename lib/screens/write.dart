import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  static String id = 'write';
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlatButton(
          color: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }
}
