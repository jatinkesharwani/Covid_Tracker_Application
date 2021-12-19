import 'dart:convert';
import 'package:covid19_tracker/Bloc/navigation_bloc.dart';
import 'package:covid19_tracker/models/vaccine_slots_model.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Vaccination Slots')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 250,
              child: Image.asset('assets/intro/vaccine.png'),
            ),
            TextField(
              controller: pincodecontroller,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(hintText: 'Enter PIN Code'),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      controller: daycontroller,
                      decoration: const InputDecoration(hintText: 'Enter Date'),
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
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    fetchslots();
                  },
                  child: const Text('Find Slots'),
                ))
          ]),
        ),
      ),
    );
  }
}