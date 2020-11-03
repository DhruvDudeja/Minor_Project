import 'package:flutter/material.dart';
import '../services/authentication.dart';
import 'package:back/screens/Info.dart';
import 'package:back/screens/welcome.dart';

List<String> userData = AuthHelper.getUserDetails();

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.red,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 10),
                    child: CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'NAME',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    'EMAIL',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text(
                'Edit profile',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, Information.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Information()),
                );
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                AuthHelper.logOut();
                Navigator.pop(context);
                Navigator.pushNamed(context, WelcomePage.id);
              })
        ],
      ),
    );
  }
}
