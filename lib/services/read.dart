import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  // StreamSubscription<NDEFMessage> _stream;
  //
  // void _startScanning() {
  //   setState(() {
  //     _stream = NFC
  //         .readNDEF(alertMessage: "Custom message with readNDEF#alertMessage")
  //         .listen((NDEFMessage message) {
  //       if (message.isEmpty) {
  //         print("Read empty NDEF message");
  //         return;
  //       }
  //       print("Read NDEF message with ${message.records.length} records");
  //       for (NDEFRecord record in message.records) {
  //         print(
  //             "Record '${record.id ?? "[NO ID]"}' with TNF '${record.tnf}', type '${record.type}', payload '${record.payload}' and data '${record.data}' and language code '${record.languageCode}'");
  //       }
  //     }, onError: (error) {
  //       setState(() {
  //         _stream = null;
  //       });
  //       if (error is NFCUserCanceledSessionException) {
  //         print("user canceled");
  //       } else if (error is NFCSessionTimeoutException) {
  //         print("session timed out");
  //       } else {
  //         print("error: $error");
  //       }
  //     }, onDone: () {
  //       setState(() {
  //         _stream = null;
  //       });
  //     });
  //   });
  // }
  //
  // void _stopScanning() {
  //   _stream?.cancel();
  //   setState(() {
  //     _stream = null;
  //   });
  // }
  //
  // void _toggleScan() {
  //   if (_stream == null) {
  //     _startScanning();
  //   } else {
  //     _stopScanning();
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _stopScanning();
  // }

  @override
  Widget build(BuildContext context) {
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
              '  HOLD NEAR THE TAG',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontFamily: 'Source Sans Pro'),
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
                NDEFMessage message = await NFC.readNDEF(once: true).first;
                print("payload: ${message.payload}");
              },
            ),
          ],
        ),

        // Text('BRING YOUR PHONE CLOSER',style: TextStyle(fontSize: 20,fontFamily: 'Source Sans Pro' ) ,),
      ),
    );
  }
}
