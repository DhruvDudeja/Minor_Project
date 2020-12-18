import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final QueryDocumentSnapshot contact;
  static String id = 'contactdetails';
  ContactDetails(this.contact);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Contact',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontFamily: 'poppins', fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(contact['name'][0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                      )),
                  radius: 70,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.black54,
                child: Text(
                  contact['name'],
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Card(
                color: Colors.black54,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.tealAccent,
                    ),
                    title: Text(
                      contact['phone'],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                  color: Colors.black54,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.tealAccent,
                      size: 35,
                    ),
                    title: Text(
                      contact['email'],
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
