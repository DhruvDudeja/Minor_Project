import 'package:back/screens/contact_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsPage extends StatefulWidget {
  static String id = 'contactspage';

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(_auth.currentUser.uid)
              .collection('contacts')
              .orderBy('name')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> querySnapshot) {
            if (querySnapshot.hasError) {
              return Text("error");
            }
            if (querySnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              final list = querySnapshot.data.docs;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var contact = list[index];
                  return Card(
                    color: Colors.black54,
                    child: ListTile(
                      // leading: CircleAvatar(
                      //   child: Text(
                      //     list[index]['name'][0].toString().toUpperCase(),
                      //     style: TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      title: Text(
                        list[index]['name'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactDetails(contact)));
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
