import 'package:flutter/material.dart';

class changeNotif extends StatefulWidget {
  const changeNotif({Key? key}) : super(key: key);

  @override
  _changeNotifState createState() => _changeNotifState();
}

class _changeNotifState extends State<changeNotif> {
  @override
  Widget build(BuildContext context) {
    bool notifProvider = true;

    return Switch.adaptive(
      value: notifProvider,
      onChanged: (value) {
        notifProvider = notifProvider;
      },
    );
  }
}
