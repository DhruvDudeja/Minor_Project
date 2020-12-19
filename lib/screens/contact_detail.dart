import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:back/services/comms.dart';

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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.teal,
                height: 250,
                width: double.infinity,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                child: Text(
                  contact['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                  color: Colors.black54,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  child: Text(
                    contact['org'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.message_rounded,
                        color: Colors.tealAccent,
                      ),
                      onPressed: () {
                        String phone = contact['phone'];
                        UrlHelper().customLaunch('sms:$phone');
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.tealAccent,
                      ),
                      onPressed: () {
                        String phone = contact['phone'];
                        UrlHelper().customLaunch('tel:$phone');
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.email,
                        color: Colors.tealAccent,
                      ),
                      onPressed: () {
                        String email = contact['email'];
                        UrlHelper().customLaunch('mailto:$email');
                      }),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Card(
                color: Colors.black54,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: ListTile(
                  title: Text(
                    'phone',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.tealAccent,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    contact['phone'],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Card(
                  color: Colors.black54,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: ListTile(
                    title: Text(
                      'email',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.tealAccent,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      contact['email'],
                      style: TextStyle(
                          fontSize: 18.0,
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
