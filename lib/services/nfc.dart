import 'dart:convert';
import 'dart:typed_data';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:back/util/converter.dart';

class NfcHelper {
  void tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      // result.value = tag.data;
      print(tag.data);
      NfcManager.instance.stopSession();
    });
  }

  void ndefWrite({String name, String phoneno, String email}) {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Ndef ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        print('tag is not writeable');
        // NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createMime(
            'text/vcard',
            Uint8List.fromList('''BEGIN:VCARD
      VERSION:3.0
      FN:$name
      TEL:$phoneno
      EMAIL:$email
      END:VCARD'''
                .codeUnits)),
      ]);

      try {
        await ndef.write(message);
        print(message);
        print('written to tag');
        // result.value = 'Success to "Ndef Write"';
        NfcManager.instance.stopSession();
      } catch (e) {
        // result.value = e;
        // NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }
}
