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
        child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.black87,
              ),
            ),
            Column(
              children: [
                Text(
                  'Dhruv Dudeja',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '971701020',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ));
  }
}
