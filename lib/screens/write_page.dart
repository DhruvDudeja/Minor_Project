import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:back/services/nfc.dart';
import 'package:back/services/read.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class WritePage extends StatefulWidget {
  static String id = 'write';
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  List _records = [];
  // StreamSubscription<NDEFMessage> _stream;
  //
  // // _tags is a list of scanned tags
  // List<NDEFMessage> _tags = [];
  //
  // bool _supportsNFC = false;
  //
  // // _readNFC() calls `NFC.readNDEF()` and stores the subscription and scanned
  // // tags in state
  // void _readNFC(BuildContext context) {
  //   try {
  //     // ignore: cancel_subscriptions
  //     StreamSubscription<NDEFMessage> subscription = NFC.readNDEF().listen(
  //         (tag) {
  //       // On new tag, add it to state
  //       setState(() {
  //         _tags.insert(0, tag);
  //       });
  //     },
  //         // When the stream is done, remove the subscription from state
  //         onDone: () {
  //       setState(() {
  //         _stream = null;
  //       });
  //     },
  //         // Errors are unlikely to happen on Android unless the NFC tags are
  //         // poorly formatted or removed too soon, however on iOS at least one
  //         // error is likely to happen. NFCUserCanceledSessionException will
  //         // always happen unless you call readNDEF() with the `throwOnUserCancel`
  //         // argument set to false.
  //         // NFCSessionTimeoutException will be thrown if the session timer exceeds
  //         // 60 seconds (iOS only).
  //         // And then there are of course errors for unexpected stuff. Good fun!
  //         onError: (e) {
  //       setState(() {
  //         _stream = null;
  //       });
  //
  //       if (!(e is NFCUserCanceledSessionException)) {
  //         showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //             title: const Text("Error!"),
  //             content: Text(e.toString()),
  //           ),
  //         );
  //       }
  //     });
  //
  //     setState(() {
  //       _stream = subscription;
  //     });
  //   } catch (err) {
  //     print("error: $err");
  //   }
  // }
  //
  // // _stopReading() cancels the current reading stream
  // void _stopReading() {
  //   _stream?.cancel();
  //   setState(() {
  //     _stream = null;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   NFC.isNDEFSupported.then((supported) {
  //     setState(() {
  //       _supportsNFC = true;
  //     });
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _stream?.cancel();
  // }

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
                  return Read();
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
                    return NDEFRecord.custom(
                        id: null,
                        type: 'text/vacrd',
                        tnf: NFCTypeNameFormat.mime_media,
                        payload: '''BEGIN:VCARD
VERSION:4.0
N:Gump;Forrest;;Mr.;
FN:Forrest Gump
ORG:Bubba Gump Shrimp Co.
TITLE:Shrimp Man
PHOTO;MEDIATYPE=image/gif:http://www.example.com/dir_photos/my_photo.gif
TEL;TYPE=work,voice;VALUE=uri:tel:+1-111-555-1212
TEL;TYPE=home,voice;VALUE=uri:tel:+1-404-555-1212
ADR;TYPE=WORK;PREF=1;LABEL="100 Waters Edge\nBaytown\, LA 30314\nUnited States of America":;;100 Waters Edge;Baytown;LA;30314;United States of America
ADR;TYPE=HOME;LABEL="42 Plantation St.\nBaytown\, LA 30314\nUnited States of America":;;42 Plantation St.;Baytown;LA;30314;United States of America
EMAIL;TYPE=INTERNET:forrestgump@example.com
GENDER:M
REV:20080424T195243Z
x-qq:21588891
END:VCARD''');
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
