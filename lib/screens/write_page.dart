import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:back/services/nfc.dart';
import 'package:back/services/read.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:simple_vcard_parser/simple_vcard_parser.dart';

class WritePage extends StatefulWidget {
  static String id = 'write';
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  List _records = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.nfc),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Color(0xff757575),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'HOLD NEAR THE TAG',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Image(
                            image: AssetImage('assets/nfcs.jpg'),
                            width: 300,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'SHARE',
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.teal,
                            onPressed: () async {
                              NDEFMessage message =
                                  await NFC.readNDEF(once: true).first;
                              print("payload: ${message.payload}");
                              VCard vc = VCard(message.payload);
                              print(vc.);
                              print(vc.email);
                              print(vc.version);
                            },
                          ),
                        ],
                      ),

                      // Text('BRING YOUR PHONE CLOSER',style: TextStyle(fontSize: 20,fontFamily: 'Source Sans Pro' ) ,),
                    ),
                  );
                });
          }),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'AKSHAY MAHARA',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                fontFamily: 'Bunch Blossoms',
              ),
            ),
            SizedBox(
              width: 150,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 9599697275',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                    ),
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.blueGrey,
                  ),
                  title: Text(
                    'akshaymahara10@gmail.com',
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                    ),
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
                color: Colors.teal,
                child: Text('write'),
                onPressed: () {
                  Stream<NDEFMessage> stream = NFC.readNDEF();

                  List<NDEFRecord> records = _records.map((record) {
//                     return NDEFRecord.custom(
//                         id: null,
//                         type: 'text/vacrd',
//                         tnf: NFCTypeNameFormat.mime_media,
//                         payload: '''BEGIN:VCARD
// VERSION:4.0
// FN:Forrest Gump
// TEL;TYPE=work,voice;VALUE=uri:tel:+1-111-555-1212
// EMAIL;TYPE=INTERNET:forrestgump@example.com
// END:VCARD''');
                    return NDEFRecord.text('hello world');
                  }).toList();

                  stream.listen((NDEFMessage message) {
                    NDEFMessage newMessage = NDEFMessage.withRecords(records);
                    message.tag.write(newMessage);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
