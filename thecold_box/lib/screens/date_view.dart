import 'package:flutter/material.dart';
import 'package:thecold_box/screens/calendar.dart';

class DateView extends StatefulWidget {
  const DateView({Key? key}) : super(key: key);

  @override
  _DateViewState createState() => _DateViewState();
}

class _DateViewState extends State<DateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalendarView()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
