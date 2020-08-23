import 'package:flutter/material.dart';
import 'package:hello_world/reminder/global_bloc.dart';
import 'package:hello_world/reminder_menu.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MedicineReminder());
}

class MedicineReminder extends StatefulWidget {
  @override
  _MedicineReminderState createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          brightness: Brightness.light,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
