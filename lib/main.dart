import 'package:covid19_tracker/Service/phone_auth.dart';
import 'package:covid19_tracker/screens/Login_Screen/SignUpPage.dart';
import 'package:covid19_tracker/screens/Login_Screen/authenticate_screen.dart';
import 'package:covid19_tracker/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
        currentPage = const SplashPage();
      });
    }
    else{
      setState(() {
        currentPage = const Authenticate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(future:authClass.getCurrent() ,builder: (context,AsyncSnapshot<dynamic> snapshot){if(snapshot.hasData){return const SplashPage();}
      else{return const Authenticate();}}),
     // home: const Authenticate(),
    );
  }
}