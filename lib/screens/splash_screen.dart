
import 'package:covid19_tracker/widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: const SideBarLayout(),
      title: const Text('Covid Tracker',textScaleFactor: 2,),
      image: Image.asset("assets/launcher/launcher.png"),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}