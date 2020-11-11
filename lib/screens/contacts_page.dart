import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  static String id = 'contactspage';

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[Column(
          children:<Widget> [ Card(child:
            ListTile(

               leading: Icon(Icons.person),
              title: 'NAME',
              subtitle: "phone ",
              dense: true,
            )
          ),
          ],
        )

        ],
      ),
    );
  }
}
