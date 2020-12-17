import 'package:back/screens/contact_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:back/services/authentication.dart';

class ContactsPage extends StatefulWidget {
  static String id = 'contactspage';

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Name'),
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(context, ContactDetails.id);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
