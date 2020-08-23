import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_world/reminder/common/convert_time.dart';
import 'package:hello_world/reminder/global_bloc.dart';
import 'package:hello_world/reminder/models/errors.dart';
import 'package:hello_world/reminder/models/reminder.dart';
import 'package:hello_world/reminder/models/type.dart';
import 'package:hello_world/reminder_menu.dart';
import 'package:hello_world/new_entry_bloc.dart';
import 'package:hello_world/success_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NewEntry extends StatefulWidget {
  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  TextEditingController nameController;
  TextEditingController dosageController;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  NewEntryBloc _newEntryBloc;

  GlobalKey<ScaffoldState> _scaffoldKey;

  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  void initState() {
    super.initState();
    _newEntryBloc = NewEntryBloc();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        title: Text(
          "Reminder Baru",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Image.asset('img/back.png'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Provider<NewEntryBloc>.value(
          value: _newEntryBloc,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            children: <Widget>[
              PanelTitle(
                title: "Nama Reminder",
                isRequired: true,
              ),
              TextFormField(
                maxLength: 100,
                style: TextStyle(
                  fontSize: 16,
                ),
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              PanelTitle(
                title: "Interval Reminder",
                isRequired: true,
              ),
              IntervalSelection(),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(right : 12.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("*menit",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 13),
                  ),
                ),
              ),
              PanelTitle(
                title: "Waktu",
                isRequired: true,
              ),
              SelectTime(),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    //width: double.infinity,
                    height: 55,
                    child: FlatButton(
                      color: Colors.green[200],
                      shape: StadiumBorder(),
                      child: Center(
                        child: Text(
                          "ATUR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      onPressed: () {
                        String medicineName;
                        int dosage;
                        //--------------------Error Checking------------------------
                        //Had to do error checking in UI
                        //Due to unoptimized BLoC value-grabbing architecture
                        if (nameController.text == "") {
                          _newEntryBloc.submitError(EntryError.NameNull);
                          return;
                        }
                        if (nameController.text != "") {
                          medicineName = nameController.text;
                        }
                        if (dosageController.text == "") {
                          dosage = 0;
                        }
                        if (dosageController.text != "") {
                          dosage = int.parse(dosageController.text);
                        }
                        for (var reminder in _globalBloc.medicineList$.value) {
                          if (medicineName == reminder.medicineName) {
                            _newEntryBloc.submitError(EntryError.NameDuplicate);
                            return;
                          }
                        }
                        if (_newEntryBloc.selectedTimeOfDay$.value == "None") {
                          _newEntryBloc.submitError(EntryError.StartTime);
                          return;
                        }
                        //---------------------------------------------------------
                        String medicineType = _newEntryBloc
                            .selectedMedicineType.value
                            .toString()
                            .substring(13);
                        int interval = _newEntryBloc.selectedInterval$.value;
                        String startTime =
                            _newEntryBloc.selectedTimeOfDay$.value;

                        List<int> intIDs =
                            makeIDs(24 / _newEntryBloc.selectedInterval$.value);
                        List<String> notificationIDs = intIDs
                            .map((i) => i.toString())
                            .toList(); //for Shared preference

                        Medicine newEntryMedicine = Medicine(
                          notificationIDs: notificationIDs,
                          medicineName: medicineName,
                          dosage: dosage,
                          medicineType: medicineType,
                          interval: interval,
                          startTime: startTime,
                        );

                        _globalBloc.updateMedicineList(newEntryMedicine);
                        scheduleNotification(newEntryMedicine);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return SuccessScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$.listen(
      (EntryError error) {
        switch (error) {
          case EntryError.NameNull:
            displayError("Masukan nama pengingat");
            break;
          case EntryError.NameDuplicate:
            displayError("Nama pengingat sudah ada");
            break;
          case EntryError.Dosage:
            displayError("");
            break;
          case EntryError.Interval:
            displayError("Pilih interval reminder shalat");
            break;
          case EntryError.StartTime:
            displayError("Pilih waktu reminder");
            break;
          default:
        }
      },
    );
  }

  void displayError(String error) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Future<void> scheduleNotification(Medicine reminder) async {
    var hour = int.parse(reminder.startTime[0] + reminder.startTime[1]);
    var ogValue = hour;
    var minute = int.parse(reminder.startTime[2] + reminder.startTime[3]);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      'repeatDailyAtTime description',
      importance: Importance.Max,
      //=sound: 'default',
      ledColor: Color(0xFFF8C2D2),
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    for (int i = 0; i < (24 / reminder.interval).floor(); i++) {
      if ((hour + (reminder.interval * i) > 23)) {
        hour = hour + (reminder.interval * i) - 24;
      } else {
        hour = hour + (reminder.interval * i);
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          int.parse(reminder.notificationIDs[i]),
          'Shalat Reminder: ${reminder.medicineName}',
          reminder.medicineType.toString() != MedicineType.None.toString()
              ? 'Ini waktunya untuk ${reminder.medicineName.toLowerCase()},'
              : 'Ini waktunya untuk shalat dhuha',
          Time(hour, minute, 0),
          platformChannelSpecifics);
      hour = ogValue;
    }
    //await flutterLocalNotificationsPlugin.cancelAll();
  }
}

class IntervalSelection extends StatefulWidget {
  @override
  _IntervalSelectionState createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  var _intervals = [
    5,
    10,
    15,
  ];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        decoration:BoxDecoration(
          color:Color(0xFFF8C2D2),
          borderRadius:BorderRadius.circular(25),
        ),
        child: Center(
          child: DropdownButton<int>(
            iconEnabledColor: Colors.white,
            hint: _selected == 0
                ? Center(
                    child : Text(
                      "Pilih Interval",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal;
                _newEntryBloc.updateInterval(newVal);
              });
            },
          ),
        ),
      ),
    );
  }
}

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context);
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        _newEntryBloc.updateTime("${convertTime(_time.hour.toString())}" +
            "${convertTime(_time.minute.toString())}");
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 4),
        child: FlatButton(
          color: Color(0xFFF8C2D2),
          shape: StadiumBorder(),
          onPressed: () {
            _selectTime(context);
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? "Pilih Waktu"
                  : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  final MedicineType type;
  final String name;
  final int iconValue;
  final bool isSelected;

  MedicineTypeColumn(
      {Key key,
      @required this.type,
      @required this.name,
      @required this.iconValue,
      @required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        _newEntryBloc.updateSelectedMedicine(type);
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Color(0xFFF8C2D2) : Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Icon(
                  IconData(iconValue, fontFamily: "Ic"),
                  size: 75,
                  color: isSelected ? Colors.white : Color(0xFF3EB16F),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFF8C2D2) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Color(0xFF3EB16F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  PanelTitle({
    Key key,
    @required this.title,
    @required this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 4),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: isRequired ? " *" : "",
            style: TextStyle(fontSize: 14, color: Color(0xFFF8C2D2)),
          ),
        ]),
      ),
    );
  }
}
