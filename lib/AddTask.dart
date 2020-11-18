import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}


class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _priority;
  DateTime _date = DateTime.now();
  TextEditingController dateController = TextEditingController();
  final List<String> priorities = ['Low', 'Moderate', 'High'];

  Color primary = Color(0xFFD6BD8E),    // Keeping the same theme as Brian, can change
      secondary = Color(0xFF2B2E33);

  //user picks date
  datePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
    if (date!= null && date != _date){
      setState(() {
        _date = date;
      });
      dateController.text = DateFormat.yMMMMEEEEd().format(date);
    }
  }

  //saving data
  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print('$_title, $_date, $_priority');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: TextStyle(
            color: primary,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          )),
        centerTitle: true,
        backgroundColor: secondary,
      ),
      body: Column(
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => input.trim().isEmpty ? 'Please enter a task title': null,
                      onSaved: (input) => _title = input,
                      initialValue: _title, //MAY DELETE
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(fontSize: 18.0),
                      controller: dateController,
                      onTap: datePicker,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: DropdownButtonFormField(
                      isDense: true,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      items: priorities.map((String priority){
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(
                            priority,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                          )
                          ),
                        );
                      }).toList(),
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: 'Priority',
                        labelStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onSaved: (input) => _priority = input,
                      onChanged: (value){
                        setState(() {
                          _priority = value;
                        });
                      },
                      value: _priority,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 60.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FlatButton(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: secondary,
                          fontSize: 20.0
                        ),
                      ),
                      onPressed: _submit,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
