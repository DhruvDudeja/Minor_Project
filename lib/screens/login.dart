import 'package:back/screens/write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:back/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:back/screens/home.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSpinner = false;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 80.0),
                  ),
                  const SizedBox(height: 120.0),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      //height: 0.8,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'poppins'),
                        decoration: InputDecoration(
                            hintText: "Enter email",
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontFamily: 'poppins'),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.tealAccent))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      //height: 0.8,
                      decoration: BoxDecoration(
                        // color: Colors.grey[500].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'poppins'),
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            hintStyle: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontFamily: 'poppins'),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.tealAccent))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ButtonTheme(
                      minWidth: 300,
                      height: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.teal,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () async {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            print("Email and password cannot be empty");
                            return;
                          }
                          try {
                            final user = await AuthHelper.signInWithEmail(
                                email: _emailController.text,
                                password: _passwordController.text);
                            if (user != null) {
                              print("login successful");
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, HomePage.id);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: 3, left: 30),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.teal,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () async {
                          try {
                            await AuthHelper.signInWithGoogle();
                            Navigator.pushNamed(context, WritePage.id);
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Colors.black,
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/google.png',
                              height: 35.0,
                            ),
                            Text(
                              "    Login with Google",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
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
