// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/myths_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/precautions_page.dart';
import 'package:covid19_tracker/screens/Statistics_Screen/world_stat.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/symptoms_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/news_updates_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/vaccine_slots_page.dart';
import 'package:covid19_tracker/screens/Home_Screen_Pages/virus_details_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryTab extends StatelessWidget {
  final imgPath, tabName, tabDesc, imgHeight, imgLeft, imgBottom;
  final Color color;
  final AutoSizeGroup titleGrp,descGrp;

   const CategoryTab(
      {Key key, this.imgPath,
      this.tabName,
      this.color,
      this.tabDesc,
      this.imgHeight = 150.0,
      this.imgLeft = 15.0,
      this.imgBottom = -8.0,
      this.titleGrp, this.descGrp}
  ) : super(key: key);

  Function getPage(tabName, context) {
    switch (tabName) {
      case ("Symptoms"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SymptomsScreen(color: color, imgPath: imgPath)));
      case ("Precautions"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PrecautionsScreen(color: color, imgPath: imgPath)));
      case ("Myths"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MythsScreen(color: color, imgPath: imgPath)));
      case ("Virus"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                VirusDetailsScreen(color: color, imgPath: imgPath)));
      case ("Updates"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UpdatesScreen(color: color, imgPath: imgPath,)));
      case ("Statistics"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const WorldStatScreen()));
      case ("Vaccine"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const VaccineSlots()));
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getPage(tabName, context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        height: 142,
        child: Stack(
          children: <Widget>[
            //Title Container
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(left: 150, right: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.13),
                  ),
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AutoSizeText(
                        "$tabName",
                        style: TextStyle(
                          color: color,
                          fontFamily: "Montserrat",
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                        stepGranularity: 1,
                        maxFontSize: 23,
                        maxLines: 1,
                        group: titleGrp,
                      ),
                      AutoSizeText(
                        "$tabDesc",
                        style: TextStyle(
                          color: color,
                          fontFamily: "Montserrat",
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                        stepGranularity: 1,
                        maxFontSize: 19,
                        maxLines: 3,
                        group: descGrp,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: imgLeft,
              bottom: imgBottom,
              child: SizedBox(
                height: imgHeight,
                child: Hero(
                    tag: imgPath, child: Image(image: AssetImage(imgPath))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
