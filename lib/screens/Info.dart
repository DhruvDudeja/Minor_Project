import 'package:back/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:back/services/authentication.dart';

class Information extends StatefulWidget {
  static String id = 'info';
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _orgController;
  TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _phoneController = TextEditingController(text: "");
    _nameController = TextEditingController(text: "");
    _orgController = TextEditingController(text: "");
    _titleController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.home_filled),
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
        ),
        centerTitle: true,
        title: Text(
          'Nimble',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Bunch Blossoms',
          ),
        ),
        actions: [FlatButton(onPressed: null, child: null)],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text("Edit your profile",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 60.0),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 70.0),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                    hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                    hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  controller: _phoneController,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  controller: _orgController,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontFamily: 'poppins'),
                  decoration: InputDecoration(
                    hintText: 'Enter organisation',
                    hintStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () async {
                      await UserHelper.saveUser(
                          _nameController.text,
                          _phoneController.text,
                          _emailController.text,
                          _orgController.text,
                          _titleController.text);
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    color: Colors.teal,
                    padding: EdgeInsets.only(top: 3, left: 3),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
