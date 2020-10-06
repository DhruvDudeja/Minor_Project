import 'package:flutter/material.dart';
import 'package:back/services/authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:back/screens/write.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showSpinner = false;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmpasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _confirmpasswordController = TextEditingController(text: "");
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
                TextField(
                  controller: _confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Confirm password"),
                ),
                const SizedBox(height: 10.0),
                RaisedButton(
                  child: Text("SignUp"),
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      print("Email and password cannot be empty");
                      return;
                    }
                    if (_confirmpasswordController.text.isEmpty ||
                        _confirmpasswordController.text !=
                            _passwordController.text) {
                      print("passwords didnt match");
                      return;
                    }
                    try {
                      final newUser = await AuthHelper.signUpWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (newUser != null) {
                        print("Account Created");
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
