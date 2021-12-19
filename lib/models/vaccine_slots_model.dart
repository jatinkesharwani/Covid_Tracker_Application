import 'package:flutter/material.dart';

class VaccineSlot extends StatefulWidget {
  final List slots;

  const VaccineSlot({Key key, this.slots}) : super(key: key);
  @override
  _VaccineSlotState createState() => _VaccineSlotState();
}

class _VaccineSlotState extends State<VaccineSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Slots'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.slots.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.blueGrey ,
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date - ' +
                          widget.slots[index]['date'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Center ID - ' +
                          widget.slots[index]['center_id'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Center Name - ' + widget.slots[index]['name'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Center Address - ' +
                          widget.slots[index]['address'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Vaccine Name - ' +
                          widget.slots[index]['vaccine'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Slots - ' + widget.slots[index]['slots'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(),
                    Text(
                      'Age-Limit - ' + widget.slots[index]['min_age_limit'].toString() + ' - ' +widget.slots[index]['max_age_limit'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Available-Capacity-Dose1 - ' + widget.slots[index]['available_capacity_dose1'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Available-Capacity-Dose2 - ' + widget.slots[index]['available_capacity_dose2'].toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}