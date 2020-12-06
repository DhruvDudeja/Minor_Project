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
          //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
            //color: Colors.grey,
            image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)
          ),child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Nimble",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      color: Colors.white ,
                      fontFamily: 'Bunch Blossoms'),
                ),
                SizedBox()

              ],
            ),
            Container(
              child: Image(image: AssetImage('assets/icons.png'),width: 300
                ,),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.white,
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
                          color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding:EdgeInsets.only(left: 30,right: 30),
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    minWidth: double.infinity,
                    color: Colors.black,
                    height: 60,
                    elevation: 0,
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF45E0EC),),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
/*
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
          //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Nimble",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                        fontFamily: 'Bunch Blossoms'),
                  ),
                  SizedBox()
                  
                ],
              ),
            Container(
              child: Image(image: AssetImage('assets/icons.png'),width: 300
                ,),
            ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: Colors.white,
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
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding:EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      minWidth: double.infinity,
                      color: Colors.black,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
