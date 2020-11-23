// import 'package:intl/intl.dart';

class Task {

  bool checked;
  String title;
  DateTime date; // TODO: I think we should try giving the user a calendar to pick dates from
  String desc;

  Task({this.checked, this.title, this.date, this.desc});

  // Task.currentDateConstructor(bool checked, String title, String desc) {
  //   this.checked = checked;
  //   this.title = title;
  //   this.date = DateFormat.yMd().format(DateTime.now()); // gets the current date as MM/DD/YYYY
  //   this.desc = desc;
  // }
}