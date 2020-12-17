import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String getInitials(name) {
  List<String> names = name.split(" ");
  String initials = "";
  int numWords = 2;

  if (numWords < names.length) {
    numWords = names.length;
  }
  for (var i = 0; i < numWords; i++) {
    initials += '${names[i][0]}';
  }
  return initials;
}

class ContactDetails extends StatelessWidget {
  final QueryDocumentSnapshot contact;
  static String id = 'contactdetails';
  ContactDetails(this.contact);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  child: Text(getInitials(contact['name'])),
                  radius: 80,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                contact['name'],
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
                      contact['phone'],
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
                      contact['email'],
                      style: TextStyle(
                        fontFamily: "Source Sans Pro",
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
} /*
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  static String id = 'contactdetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
*/
