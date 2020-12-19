import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcHelper {
  void ndefWrite(
      {@required String name,
      @required String phoneno,
      @required String email,
      String org,
      String title}) {
    String output;
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Ndef ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        output = 'tag is not writeable';
        print(output);
        // NfcManager.instance.stopSession(errorMessage: result.value);
        return output;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createMime(
            'text/vcard',
            Uint8List.fromList('''BEGIN:VCARD
VERSION:3.0
FN:$name
TEL:$phoneno
EMAIL:$email
ORG:$org
TITLE:$title
END:VCARD'''
                .codeUnits)),
      ]);

      try {
        await ndef.write(message);
        print(message);
        print('written to tag');
        output = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        output = e.toString();
        // NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return output;
      }
    });
  }
}
