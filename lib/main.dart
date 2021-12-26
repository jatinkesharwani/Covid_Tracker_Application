/*
import 'package:covid19_tracker/screens/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroPage(),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

 */
import 'package:covid19_tracker/Service/phone_auth.dart';
import 'package:covid19_tracker/screens/pages/HomePage.dart';
import 'package:covid19_tracker/screens/pages/SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();
  Widget currentPage = const SignUpPage();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String tokne = await authClass.getToken();
    //print("tokne");
    if (tokne != null) {
      setState(() {
        currentPage = const HomePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentPage,
    );
  }
}