import 'package:back/screens/Info.dart';
import 'package:back/screens/contacts_page.dart';
import 'package:back/screens/home.dart';
import 'package:back/screens/register.dart';
import 'package:back/screens/write_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/contact_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: HomePage(),
    initialRoute: WritePage.id,
    routes: {
      WelcomePage.id: (context) => WelcomePage(),
      LoginPage.id: (context) => LoginPage(),
      WritePage.id: (context) => WritePage(),
      RegisterPage.id: (context) => RegisterPage(),
      HomePage.id: (context) => HomePage(),
      Information.id: (context) => Information(),
      ContactsPage.id: (context) => ContactsPage(),
      ContactDetails.id: (context) => ContactDetails(),
    },
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          }
          return LoginPage();
        });
  }
}
