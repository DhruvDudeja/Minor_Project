import 'package:back/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:back/screens/register.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcome';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Nimble",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        fontFamily: 'Bunch Blossoms'),
                  ),
                  SizedBox()
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFF18D191),
                ),
                child: Icon(
                  Icons.subject,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Color(0xFFFC6A7F),
                ),
                child: Icon(
                  Icons.group,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Color(0xFF45E0EC),
                ),
                child: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 2),
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Color(0xFFFFCE56),
                ),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    minWidth: double.infinity,
                    color: Color(0xFFFC6A7F),
                    height: 60,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF45E0EC)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
