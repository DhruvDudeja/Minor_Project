import 'package:flutter/material.dart';
import '../services/authentication.dart';
import 'package:back/screens/Info.dart';
import 'package:back/screens/welcome.dart';

Map userData = AuthHelper.getUserDetails();

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.teal,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    Text(
                      'Welcome !',
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userData['email'],
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Colors.tealAccent,
                ),
                title: Text(
                  'Edit profile',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
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
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.tealAccent,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  AuthHelper.logOut();
                  Navigator.pop(context);
                  Navigator.pushNamed(context, WelcomePage.id);
                })
          ],
        ),
      ),
    );
  }
}
