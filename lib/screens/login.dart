import 'package:back/screens/write.dart';
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
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50.0),
                    ),
                    const SizedBox(height: 100.0),
                    const SizedBox(height: 20.0),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Enter email",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]))),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]))),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: ButtonTheme(
                        minWidth: 300,
                        height: 50,
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          color: Color(0xFFFC6A7F),
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
                                Navigator.pushNamed(context, HomePage.id);
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
                    Text('OR'),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
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
                          color: Colors.white,
                          child: new Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/google.jpg',
                                height: 35.0,
                              ),
                              Text(
                                "         Login with Google",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
