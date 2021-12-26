import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0XFF8d12fe),
              const Color(0XFF8d12fe).withOpacity(.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildHeader(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Image.asset("assets/intro/virus.png"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .25,
              right: 25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Image.asset("assets/intro/person.png"),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset("assets/intro/logo.png"),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Coronavirus disease (COVID-19)",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "is an infectianus disease caused by a new\nvirus.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}