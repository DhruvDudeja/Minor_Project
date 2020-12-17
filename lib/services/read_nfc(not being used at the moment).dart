import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
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
