import 'dart:async';
import 'package:covid19_tracker/screens/SideBar/sidebar_layout.dart';
import 'package:covid19_tracker/screens/intro_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SideBarLayout())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroPage(),
    );
  }
}