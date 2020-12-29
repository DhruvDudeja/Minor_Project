import 'package:carousel_slider/carousel_slider.dart';
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
                                  vc.formattedName,
                                  vc.telephone,
                                  vc.email,
                                  vc.title,
                                  vc.organisation);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              'Your cards',
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return SafeArea(
                  child: Center(
                      child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.8,
                      aspectRatio: 3 / 4,
                      autoPlay: false,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 65,
                                  child: Icon(
                                    Icons.person,
                                    size: 75,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                elevation: 0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                color: Colors.teal,
                                child: Text(
                                  snapshot.data['name'],
                                  style: TextStyle(
                                      fontSize: 31.0,
                                      color: Colors.white,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Card(
                                color: Colors.teal,
                                elevation: 0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                child: ListTile(
                                    title: Text(
                                  snapshot.data['title'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                              Card(
                                elevation: 0,
                                color: Colors.teal,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                child: ListTile(
                                    title: Text(
                                  snapshot.data['org'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                              Card(
                                elevation: 0,
                                color: Colors.teal,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    title: Text(
                                      snapshot.data['phone'],
                                      style: TextStyle(
                                        fontSize: 17.0,
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
                                  elevation: 0,
                                  color: Colors.teal,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 50),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                      size: 30,
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
                                color: Colors.black,
                                child: Text('Write to Nimble',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  NfcHelper().ndefWrite(
                                      name: snapshot.data['name'],
                                      phoneno: snapshot.data['phone'],
                                      email: snapshot.data['email'],
                                      org: snapshot.data['org'],
                                      title: snapshot.data['title']);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 65,
                                  child: Icon(
                                    Icons.person,
                                    size: 75,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                elevation: 0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                color: Colors.teal,
                                child: Text(
                                  snapshot.data['name'],
                                  style: TextStyle(
                                      fontSize: 31.0,
                                      color: Colors.white,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                color: Colors.teal,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    title: Text(
                                      snapshot.data['phone'],
                                      style: TextStyle(
                                        fontSize: 17.0,
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
                                  elevation: 0,
                                  color: Colors.teal,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 50),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                      size: 30,
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
                              Card(
                                elevation: 0,
                                color: Colors.teal,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.map_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  title: Text(
                                    'XYZ-123, New Delhi 110058',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              RaisedButton(
                                color: Colors.black,
                                child: Text('Write to Nimble',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  NfcHelper().ndefWrite(
                                      name: snapshot.data['name'],
                                      phoneno: snapshot.data['phone'],
                                      email: snapshot.data['email'],
                                      org: snapshot.data['org'],
                                      title: snapshot.data['title']);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 65,
                                  child: Icon(
                                    Icons.person,
                                    size: 75,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Card(
                                elevation: 0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 50),
                                color: Colors.teal,
                                child: Text(
                                  snapshot.data['name'],
                                  style: TextStyle(
                                      fontSize: 31.0,
                                      color: Colors.white,
                                      fontFamily: 'poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                color: Colors.teal,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    title: Text(
                                      snapshot.data['phone'],
                                      style: TextStyle(
                                        fontSize: 17.0,
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
                                  elevation: 0,
                                  color: Colors.teal,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 50),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                      size: 30,
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
                                height: 100,
                              ),
                              RaisedButton(
                                color: Colors.black,
                                child: Text('Write to Nimble',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  NfcHelper().ndefWrite(
                                      name: snapshot.data['name'],
                                      phoneno: snapshot.data['phone'],
                                      email: snapshot.data['email'],
                                      org: snapshot.data['org'],
                                      title: snapshot.data['title']);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                );

                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Center(
                //       child: CircleAvatar(
                //         backgroundColor: Colors.teal,
                //         radius: 80,
                //         child: Icon(
                //           Icons.person,
                //           size: 80,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Card(
                //       margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                //       color: Colors.black12,
                //       child: Text(
                //         snapshot.data['name'],
                //         style: TextStyle(
                //             fontSize: 40.0,
                //             color: Colors.white,
                //             fontFamily: 'poppins',
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //     Card(
                //       color: Colors.black12,
                //       margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                //       child: ListTile(
                //           title: Text(
                //         snapshot.data['title'],
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           color: Colors.white,
                //           fontFamily: 'poppins',
                //           fontWeight: FontWeight.bold,
                //         ),
                //       )),
                //     ),
                //     Card(
                //       color: Colors.black12,
                //       margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                //       child: ListTile(
                //           title: Text(
                //         snapshot.data['org'],
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 18.0,
                //           color: Colors.white,
                //           fontFamily: 'poppins',
                //           fontWeight: FontWeight.bold,
                //         ),
                //       )),
                //     ),
                //     Card(
                //       color: Colors.black12,
                //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                //       child: ListTile(
                //           leading: Icon(
                //             Icons.phone,
                //             color: Colors.tealAccent,
                //             size: 35,
                //           ),
                //           title: Text(
                //             snapshot.data['phone'],
                //             style: TextStyle(
                //               fontSize: 18.0,
                //               color: Colors.white,
                //               fontFamily: 'poppins',
                //               fontWeight: FontWeight.bold,
                //             ),
                //           )),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Card(
                //         color: Colors.black12,
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                //         child: ListTile(
                //           leading: Icon(
                //             Icons.mail,
                //             color: Colors.tealAccent,
                //             size: 35,
                //           ),
                //           title: Text(
                //             snapshot.data['email'],
                //             style: TextStyle(
                //                 fontSize: 15.0,
                //                 color: Colors.white,
                //                 fontFamily: 'poppins',
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         )),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     RaisedButton(
                //       color: Colors.teal,
                //       child: Text('Write to Nimble',
                //           style: TextStyle(
                //               fontSize: 20.0,
                //               color: Colors.white,
                //               fontFamily: 'poppins',
                //               fontWeight: FontWeight.bold)),
                //       onPressed: () {
                //         NfcHelper().ndefWrite(
                //             name: snapshot.data['name'],
                //             phoneno: snapshot.data['phone'],
                //             email: snapshot.data['email'],
                //             org: snapshot.data['org'],
                //             title: snapshot.data['title']);
                //       },
                //     ),
                //   ],
                // ),);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
