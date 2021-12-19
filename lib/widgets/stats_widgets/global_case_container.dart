import 'package:auto_size_text/auto_size_text.dart';

import '../../screens/stats_dashboard_screens/world_stat.dart';
import 'package:flutter/material.dart';
import 'progress_widget.dart';
import 'graph_panel.dart';

// ignore: must_be_immutable
class GlobalCaseContainer extends StatefulWidget {
  Map<String, dynamic> globalData;
  
  GlobalCaseContainer({Key key, this.globalData}) : super(key: key);
  
  @override
  _GlobalCaseContainerState createState() => _GlobalCaseContainerState();
}

class _GlobalCaseContainerState extends State<GlobalCaseContainer> {
  CaseType _caseType;
  Color radialStartClr, radialEndClr, radialBgClr,panelStartClr, panelFontClr, panelIconClr, panelLineClr;
  double progress;
  Duration caseTypeDuration = const Duration(milliseconds: 400);
  Curve caseTypeCurve = Curves.ease;

  void updateRadialDial() {
    if (_caseType == CaseType.active) {
      radialStartClr = Colors.purpleAccent[100];
      radialEndClr = Colors.purpleAccent[700];
      radialBgClr = const Color(0xfffde6ff);
      progress = (widget.globalData["active"] + 0.0) / widget.globalData["cases"];
    } else if (_caseType == CaseType.deaths) {
      radialStartClr = Colors.redAccent[100];
      radialEndClr = Colors.redAccent[700];
      radialBgClr = Colors.red[50];
      progress = (widget.globalData["deaths"] + 0.0) / widget.globalData["cases"];
    } else if (_caseType == CaseType.recovered) {
      radialStartClr = Colors.greenAccent[100];
      radialEndClr = Colors.greenAccent[700];
      radialBgClr = Colors.green[50];
      progress = (widget.globalData["recovered"] + 0.0) / widget.globalData["cases"];
    }
  }

  void updateCasesPanel() {
    if (_caseType == CaseType.active) {
      panelFontClr = const Color(0xff7f2d91); //Color(0xff684024);
      panelStartClr = const Color(0xfff7deff); //Color(0xffffe9d4);
      panelIconClr = const Color(0xffcc00ff); //Color(0xffff9900);
      panelLineClr = const Color(0xffca4eff); //Color(0xffff8c4e);
    } else if (_caseType == CaseType.deaths) {
      panelFontClr = const Color(0xff682429);
      panelStartClr = const Color(0xfffbe7e8);
      panelIconClr = const Color(0xffff000f);
      panelLineClr = const Color(0xffff4e5d);
    } else if (_caseType == CaseType.recovered) {
      panelFontClr = const Color(0xff1d5422);
      panelStartClr = const Color(0xffe8f3f2);
      panelIconClr = const Color(0xff00c261);
      panelLineClr = const Color(0xff44db6c);
    }
  }

  @override
  void initState() {
    super.initState();
    _caseType = CaseType.active;
    updateRadialDial();
    updateCasesPanel();
  }

  AutoSizeGroup caseTypeGrp=AutoSizeGroup();
  AutoSizeGroup caseNumGrp=AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        height: MediaQuery.of(context)
            .size
            .width >340 ?298:302,
        padding: const EdgeInsets.fromLTRB(5, 16, 5, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Row of Case Types
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Active Cases
                  InkWell(
                    onTap: () {
                      setState(() {
                        _caseType = CaseType.active;
                        updateRadialDial();
                        updateCasesPanel();
                      });
                    },
                    child: AnimatedContainer(
                      duration: caseTypeDuration,
                      curve: caseTypeCurve,
                      decoration: BoxDecoration(
                        color: _caseType == CaseType.active
                            ? const Color(
                            0xfff3cfff) //Color(0xffffd9b5)
                            : Colors.white,
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context)
                            .size
                            .width >
                            360.0
                            ? 16
                            : MediaQuery.of(context)
                            .size
                            .width >340 ? 14:8,
                        vertical: 12,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          "Active",
                          style: TextStyle(
                            color: const Color(0xFFAA00FF),
                            fontFamily: "Montserrat",
                            fontSize: MediaQuery.of(context)
                                .size
                                .width >340 ?16:15,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                          ),
                          maxFontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width >
                        360.0
                        ? 15
                        : 6,
                  ),

                  //Deaths
                  InkWell(
                    onTap: () {
                      setState(() {
                        _caseType = CaseType.deaths;
                        updateRadialDial();
                        updateCasesPanel();
                      });
                    },
                    child: AnimatedContainer(
                      duration: caseTypeDuration,
                      curve: caseTypeCurve,
                      decoration: BoxDecoration(
                          color: _caseType == CaseType.deaths
                              ? const Color(0xffffcfcc)
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context)
                            .size
                            .width >
                            360.0
                            ? 16
                            : MediaQuery.of(context)
                            .size
                            .width >340 ? 14:8,
                        vertical: 12,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          "Deaths",
                          style: TextStyle(
                            color: const Color(0xFFD50000),
                            fontFamily: "Montserrat",
                            fontSize: MediaQuery.of(context)
                                .size
                                .width >340 ?16:15,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                          ),
                          maxFontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width >
                        360.0
                        ? 15
                        : 6,
                  ),

                  //Recoveries
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _caseType = CaseType.recovered;
                          updateRadialDial();
                          updateCasesPanel();
                        });
                      },
                      child: AnimatedContainer(
                        curve: caseTypeCurve,
                        duration: caseTypeDuration,
                        decoration: BoxDecoration(
                            color: _caseType ==
                                CaseType.recovered
                                ? const Color(0xffdbffe5)
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: MediaQuery.of(context)
                              .size
                              .width > 340 ? 0 : 8,
                        ),
                        child: const Center(
                          child: AutoSizeText(
                            "Recovered",
                            style: TextStyle(
                              color: Color(0xFF00C853),
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w700,
                            ),
                            maxFontSize: 16,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            //Row of Radial Dial and Case Count Column
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Radial Progress Indicator
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RadialProgress(
                      progressValue: progress,
                      startClr: radialStartClr,
                      endClr: radialEndClr,
                      bgClr: radialBgClr,
                    ),
                  ),

                  //Global Case Count Panels
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: <Widget>[
                        //Affected Cases Panel
                        SmallGraphPanel(
                          label: "Confirmed",
                          value: widget.globalData["cases"] + 0.0,
                          icon: Icons.arrow_drop_up,
                          fontColor: panelFontClr,
                          iconColor: panelIconClr,
                          startColor: panelStartClr,
                          lineColor: panelLineClr,
                          isIncreasing: true,
                          numGrp: caseNumGrp,
                          titleGrp: caseTypeGrp,
                        ),

                        const SizedBox(
                          height: 12,
                        ),

                        //Total Type Cases Panel
                        SmallGraphPanel(
                          label: _caseType == CaseType.active
                              ? "Active"
                              : _caseType == CaseType.deaths
                              ? "Deaths"
                              : "Recovered",
                          value: _caseType == CaseType.active
                              ? widget.globalData["active"] + 0.0
                              : _caseType == CaseType.deaths
                              ? widget.globalData["deaths"] + 0.0
                              : widget.globalData["recovered"] +
                              0.0,
                          icon: Icons.arrow_drop_up,
                          fontColor: panelFontClr,
                          iconColor: panelIconClr,
                          startColor: panelStartClr,
                          lineColor: panelLineClr,
                          isIncreasing: true,
                          numGrp: caseNumGrp,
                          titleGrp: caseTypeGrp,
                        ),

                        const SizedBox(
                          height: 12,
                        ),

                        //New Cases Panel
                        SmallGraphPanel(
                          label:
                          _caseType == CaseType.recovered
                              ? "Per Million"
                              : "Today",
                          value: _caseType == CaseType.active
                              ? widget.globalData["todayCases"] + 0.0
                              : _caseType == CaseType.deaths
                              ? widget.globalData[
                          "todayDeaths"] +
                              0.0
                              : widget.globalData[
                          "recoveredPerOneMillion"] +
                              0.0,
                          icon: Icons.arrow_drop_up,
                          fontColor: panelFontClr,
                          iconColor: panelIconClr,
                          startColor: panelStartClr,
                          lineColor: panelLineClr,
                          isIncreasing: true,
                          numGrp: caseNumGrp,
                          titleGrp: caseTypeGrp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
