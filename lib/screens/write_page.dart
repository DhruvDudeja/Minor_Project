import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:back/services/write_nfc.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:simple_vcard_parser/simple_vcard_parser.dart';
import 'package:back/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _db = FirebaseFirestore.instance;

class WritePage extends StatefulWidget {
  static String id = 'write';
  @override
  _WritePageState createState() => _WritePageState();
}

Future getUserData() async {
  User user = _auth.currentUser;
  Map data;
  final _userDataRef = _db.collection('users').doc(user.uid);
  data = await _userDataRef
      .get()
      .then((DocumentSnapshot document) => document.data());
  return data;
}

class _WritePageState extends State<WritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.nfc),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.black,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Hold your device near Nimble',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Image(
                            image: AssetImage('assets/nfcs.png'),
                            width: 200,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Scan Nimble',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.teal,
                            onPressed: () async {
                              NDEFMessage message = await NFC
                                  .readNDEF(
                                      once: true,
                                      readerMode: NFCDispatchReaderMode())
                                  .first;
                              print(message.payload);
                              VCard vc = VCard(message.payload);
                              UserHelper.saveContact(
                                  vc.formattedName, vc.telephone, vc.email);
                            },
                          ),
                        ],
                      ),

                      // Text('BRING YOUR PHONE CLOSER',style: TextStyle(fontSize: 20,fontFamily: 'Source Sans Pro' ) ,),
                    ),
                  );
                });
          }),
      body: FutureBuilder(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    color: Colors.black12,
                    child: Text(
                      snapshot.data['name'],
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Card(
                    color: Colors.black12,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.tealAccent,
                          size: 35,
                        ),
                        title: Text(
                          snapshot.data['phone'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                      color: Colors.black12,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      child: ListTile(
                        leading: Icon(
                          Icons.mail,
                          color: Colors.tealAccent,
                          size: 35,
                        ),
                        title: Text(
                          snapshot.data['email'],
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.teal,
                    child: Text('Write to Nimble',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      NfcHelper().ndefWrite(
                          name: snapshot.data['name'],
                          phoneno: snapshot.data['phone'],
                          email: snapshot.data['email']);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
