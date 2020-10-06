import 'package:back/screens/write.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:back/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100.0),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Enter email"),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter password"),
                ),
                const SizedBox(height: 10.0),
                RaisedButton(
                  child: Text("Login"),
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
                        Navigator.pushNamed(context, WritePage.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Login with Google"),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
