import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19_tracker/Data_Source/api_client.dart';
import 'package:covid19_tracker/Data_Source/exceptions.dart';
import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/widgets/news_widgets/news_tile.dart';
import 'package:covid19_tracker/widgets/news_widgets/updates_page_carousel.dart';
import 'package:covid19_tracker/widgets/skeletons/news_list_skeleton.dart';
import 'package:flutter/material.dart';

class UpdatesScreen extends StatefulWidget with NavigationStates {
  // ignore: prefer_typing_uninitialized_variables
  final imgPath;
  final Color color;

  const UpdatesScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  String dropDownValue = "publishedAt";
  final ApiClient _client = ApiClient();
  Future<dynamic> _newsFuture;

  getNews() async {
    // ignore: prefer_typing_uninitialized_variables
    var json;
    try {
      json = await _client.getNewsResponse(dropDownValue);
    } on FetchDataException catch (fde) {
      return fde;
    }
    var articles = json['articles'];
    return articles;
  }

  refresh() async{
    await Future.delayed(const Duration(milliseconds: 800),() {
      setState(() {
        _newsFuture=getNews();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _newsFuture=getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const AutoSizeText(
          "Covid-19 Updates",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 20,
              fontWeight: FontWeight.w600,
          ),
          stepGranularity: 2,
          maxFontSize: 20,
          minFontSize: 14,
          maxLines: 1,
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _newsFuture=null;
                refresh();
              });
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: LayoutBuilder(
            builder: (ctx, constraint) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Carousel
                ImageCarousel(height: constraint.maxHeight*0.26,),

                //Divider
               const Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                ),

                //Sorting + drop down
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Sort by
                    Padding(
                      padding: MediaQuery.of(context).size.width>360.0? const EdgeInsets.only(left: 20):const EdgeInsets.only(left: 0),
                      child: const LimitedBox(
                        maxWidth: 68,
                        child: AutoSizeText(
                          "Sort By",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          stepGranularity: 2,
                          maxFontSize: 18,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width > 340.0?10:7),

                    const Expanded(child: Icon(Icons.filter_list,size: 26,)),

                    const SizedBox(width: 10),

                    //DropDown
                    Container(
                      width: constraint.maxWidth*0.63,
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Center(
                        child: Theme(
                          data: ThemeData(
                            canvasColor: Colors.black,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            itemHeight: 50,
                            value: dropDownValue,
                            underline: Container(
                              height: 0,
                            ),
                            elevation: 20,
                            iconSize: 28,
                            icon: const Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                            items: const <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                value: "publishedAt",
                                child: SizedBox(
                                  width: 55,
                                  child: AutoSizeText(
                                    "Latest",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "popular",
                                child: SizedBox(
                                  width: 68,
                                  child: AutoSizeText(
                                    "Popular",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Last Week",
                                child: SizedBox(
                                  width: 90,
                                  child: AutoSizeText(
                                    "Last Week",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Last 15",
                                child: SizedBox(
                                  width: 99,
                                  child: AutoSizeText(
                                    "Last 15 days",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Last Month",
                                child: SizedBox(
                                  width: 97,
                                  child: AutoSizeText(
                                    "Last Month",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    stepGranularity: 1,
                                    maxFontSize: 17,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (String newValue) {
                              setState(() {
                                dropDownValue = newValue;
                                _newsFuture=getNews();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Divider
                const Divider(
                  color: Colors.black,
                  height: 25,
                  thickness: 2,
                ),

                //News tiles
                Expanded(
                  child: FutureBuilder<dynamic>(
                    future: _newsFuture,
                    builder: (context, snapshot) {
                      return (snapshot.data == null || snapshot.connectionState!=ConnectionState.done)
                          ? const NewsListLoader()
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: (snapshot.data is FetchDataException)?20:40,
                                  color: Colors.black,
                                  thickness: 2,
                                );
                              },
                              itemBuilder: (context, index) {
                                if (snapshot.data is FetchDataException) {
                                  return Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: AutoSizeText(
                                        snapshot.data.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                        maxFontSize: 16,
                                        stepGranularity: 2,
                                      ),
                                    ),
                                  );
                                }
                                return NewsTile(article:snapshot.data[index]);
                              },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
