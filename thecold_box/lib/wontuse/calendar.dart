import 'package:flutter/material.dart';
import 'package:thecold_box/screens/date_view.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          child: Column(children: [
        ListTile(
          title: Text(
              'Date: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}'),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: pickDate,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              child: Text('Click me'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DateView()))),
        ),
      ])),
    ]);
  }

  pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: pickedDate,
    );

    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }
}
