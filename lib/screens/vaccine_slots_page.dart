import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/Bloc/vaccine_slots_bloc.dart';
import 'package:covid19_tracker/models/vaccine_slots_model.dart';
import 'package:covid19_tracker/widgets/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VaccineSlots extends StatefulWidget with NavigationStates {
  const VaccineSlots({Key key}) : super(key: key);

  @override
  _VaccineSlotsState createState() => _VaccineSlotsState();
}

class _VaccineSlotsState extends State<VaccineSlots> {
  //------------------------------------------------
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();

  String dropdownValue = '01';
  String dropdownValue1 = '2021';
  List slots = [];

  fetchslots() async {
    await http
    //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=470002&date=20%2F12%2F2021
        .get(Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
            pincodecontroller.text +
            '&date=' +
            daycontroller.text +
            '%2F' +
            dropdownValue +
            '%2F' + dropdownValue1))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VaccineSlot(
                slots: slots,
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          title: const AutoSizeText(
            "Vaccination Slots",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            minFontSize: 14,
            stepGranularity: 2,
            maxLines: 1,
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            const SizedBox(height: 40,),
            Container(
              margin: const EdgeInsets.all(20),
              height: 250,
              child: Image.asset('assets/intro/vaccine.png'),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: StreamBuilder<String>(
                stream: bloc.outPinCode,
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.inPinCode,
                  controller: pincodecontroller,
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  decoration: InputDecoration(
                      hintText: 'Enter PIN Code',
                      errorText: snapshot.error,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: StreamBuilder<String>(
                        stream: bloc.outEnterDate,
                        builder: (context, snapshot) => TextField(
                          onChanged: bloc.inEnterDate,
                          controller: daycontroller,
                          decoration: InputDecoration(
                              hintText: 'Enter Date',
                            errorText: snapshot.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          color: Colors.grey.shade400,
                          height: 2,
                        ),
                        onChanged: (newvalue){
                          setState(() {
                            dropdownValue = newvalue;
                          });
                        },
                        items: <String>[
                          '01',
                          '02',
                          '03',
                          '04',
                          '05',
                          '06',
                          '07',
                          '08',
                          '09',
                          '10',
                          '11',
                          '12'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue1,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          color: Colors.grey.shade400,
                          height: 2,
                        ),
                        onChanged: (newvalue){
                          setState(() {
                            dropdownValue1 = newvalue;
                          });
                        },
                        items: <String>[
                          '2021',
                          '2022',
                          '2023',
                          '2024',
                          '2025'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
                onTap: () {
                  fetchslots();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .92,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
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
                  child: const Center(
                    child: Text(
                      "Find Slots",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}