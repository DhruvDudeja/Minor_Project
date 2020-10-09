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
                    const SizedBox(height: 100.0),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Enter email",
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200])
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Enter password",
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200])
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Confirm password",
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200])
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: ButtonTheme(
                        minWidth: 300,
                        height: 50,
                        child: RaisedButton(
                          child: Text("SignUp", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                            ,
                          ),
                          color: Color(0xFF45E0EC),
                          shape: RoundedRectangleBorder(side: BorderSide(

                            color: Colors.black,
                          ),
                            borderRadius: BorderRadius.circular(50)
                          ),
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
