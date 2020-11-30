import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:taskiller/AddTask.dart';
import 'task.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (context) => CheckboxesDemo(), '/addTask': (context) =>AddTaskScreen(), },
      title: 'TasKiller',
      debugShowCheckedModeBanner: false,
      home: CheckboxesDemo(),
    );
  }
}

class CheckboxesDemo extends StatefulWidget {
  @override
  _CheckboxesDemoState createState() => _CheckboxesDemoState();
}

class _CheckboxesDemoState extends State<CheckboxesDemo> {
  // There's a Task class in lib/task.dart
  // Once we have a database then this array of tasks will be pulled
  // from there, but for now I just constructed 5 tasks inside the array

List<Task> tasks = [
     // Task(checked: false, title: 'Task 1', date: DateTime(2020, 11, 9), priority: 'Low'),
    //  Task(checked: false, title: 'Task 2', date: DateTime(2020, 11, 8), desc: 'This is the second task'),
    //  Task(checked: false, title: 'Task 3', date: DateTime(2020,11,7), desc: 'This is the third task'),
    // Task(checked: true, title: 'Task 4',date: DateTime(2020, 11, 6), desc: 'This is the fourth task'),
    // Task(checked: true, title: 'Task 5', date: DateTime(2020, 11, 5), desc: ''),
  ];

  bool asc = true;
  DateFormat dateformatter = DateFormat.yMMMMd('en_US');
Color primary = Color(0xFFD6BD8E),    // Brian: Just some styles because I got distracted lol
        secondary = Color(0xFF2B2E33);

  @override
  void initState() {
    tasks.sort((t1, t2) => t1.date.compareTo(t2.date));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TasKiller',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: primary,
        )),
        centerTitle: true,
        backgroundColor: secondary,
          actions: [
            IconButton(
              icon: Icon(Icons.sort),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  if(asc){
                  tasks.sort((t1, t2) => t2.date.compareTo(t1.date));
                  asc = false;}
                  else{
                    tasks.sort((t1, t2) => t1.date.compareTo(t2.date));
                    asc = true; }
                });
              },
            )
          ]

      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ReorderableListView(
          children: [ for (var i = 0; i < tasks.length; i++)
            Dismissible(
              key: new Key(tasks[i].checked.toString()+tasks[i].title+tasks[i].date.toString()+tasks[i].priority),
              child: Row(
                children: [
                  Checkbox(
                    value: tasks[i].checked,
                    onChanged: (bool val) {
                      setState(() => tasks[i].checked = val);
                    },
                    activeColor: secondary,
                    checkColor: primary,
                  ),
                  Expanded(
                    child: ListTile(
                      title: (tasks[i].priority != null && tasks[i].priority != '') ? Text('${tasks[i].title} - ${tasks[i].priority}') : Text(tasks[i].title),
                      subtitle: (tasks[i].date != null && tasks[i].date != '')? Text(dateformatter.format(tasks[i].date)) : null,
                      onTap: () {
                        // TODO: open a Dialog for details where you can read the description and edit details: https://material.io/develop/flutter/components/dialogs
                      }
                    )
                  ),
                ]
              ),
              onDismissed: (direction) {
                setState(() => tasks.removeAt(tasks.indexOf(tasks[i])));
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Deleted ${tasks[i].title}'))
                );
              },
              background: Container(
                color: Colors.red,
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 42
                  ),
                )
              ),
              direction: DismissDirection.endToStart,
            )
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex -= 1;
              final Task task = tasks.removeAt(oldIndex);
              tasks.insert(newIndex, task);
            });
          }
        )
      ),
      // backgroundColor: primary,
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: primary,
            size: 40.0,
          ),
          backgroundColor: secondary,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AddTaskScreen(tasks: tasks)
            ),
          ).then((value) => setState((){

        })), //direct to add
      ),
    );
  }
}