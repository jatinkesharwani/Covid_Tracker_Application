import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/widgets/FAQs_Data/faqs_data.dart';
import 'package:covid19_tracker/widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget with NavigationStates {
  const FAQPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const SideBarLayout(),
        )),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AutoSizeText(
          "FAQs",
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
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return Card(
              child: ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    DataSource.questionAnswers[index]['question'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(DataSource.questionAnswers[index]['answer'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      //color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),),
                  )
                ],
              ),
            );
          }),
    );
  }
}