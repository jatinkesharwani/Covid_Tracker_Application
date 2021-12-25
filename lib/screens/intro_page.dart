import 'package:covid19_tracker/widgets/sidebar/sidebar_layout.dart';
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
          children: <Widget>[
            const Text(
              "Coronavirus disease (COVID-19)",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "is an infectianus disease caused by a new\nvirus.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SideBarLayout(),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * .85,
                height: 60,
                child: const Center(
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Color(0XFF8d12fe),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}