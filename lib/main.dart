import 'package:back/screens/Info.dart';
import 'package:back/screens/contacts_page.dart';
import 'package:back/screens/home.dart';
import 'package:back/screens/register.dart';
import 'package:back/screens/write.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

    home:
    HomePage(),
    //initialRoute: WelcomePage.id,
   routes: {
     //WelcomePage.id: (context) => WelcomePage(),
     //LoginPage.id: (context) => LoginPage(),
     WritePage.id: (context) => WritePage(),
     RegisterPage.id: (context) => RegisterPage(),
     HomePage.id: (context) => HomePage(),
       Information.id: (context) => Information(),
     ContactsPage.id: (context) => ContactsPage(),
   }));
}

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User>();
//   }
// }
