import 'package:back/screens/contact_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsPage extends StatelessWidget {
  static String id = 'contactspage';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser.uid)
          .collection('contacts')
          .orderBy('name')
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
        if (querySnapshot.hasError) {
          return Text("error");
        }
        if (querySnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final list = querySnapshot.data.docs;
          return ListView.builder(
            itemBuilder: (context, index) {
              var contact = list[index];
              return ListTile(
                title: Text(list[index]['name']),
                dense: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactDetails(contact)));
                },
              );
            },
            itemCount: list.length,
          );
        }
      },
    );
  }
}
