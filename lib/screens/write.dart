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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.nfc),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.white,
                  );
                });
          }),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'AKSHAY MAHARA',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                fontFamily: 'Bunch Blossoms',
              ),
            ),
            SizedBox(
              width: 150,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 9599697275',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                    ),
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'akshaymahara10@gmail.com',
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
