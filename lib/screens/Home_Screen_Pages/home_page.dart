import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget with NavigationStates {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AutoSizeText(
          "Covid-19 Tracker",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
      ),
      body: const HomeCategories(),
    );
  }
}
