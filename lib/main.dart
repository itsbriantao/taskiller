import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:taskiller/AddTask.dart';
import 'task.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    Task(checked: false, title: 'Task 1', date: '11/8/2020', desc: 'This is the first task'),
    Task(checked: false, title: 'Task 2', date: '11/9/2020', desc: 'This is the second task'),
    Task(checked: false, title: 'Task 3', date: '', desc: 'This is the third task'),
    Task(checked: true, title: 'Task 4', date: '11/7/2020', desc: 'This is the fourth task'),
    Task(checked: true, title: 'Task 5', date: '11/6/2020', desc: ''),
  ];
  Color primary = Color(0xFFD6BD8E),    // Brian: Just some styles because I got distracted lol
        secondary = Color(0xFF2B2E33);

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
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ReorderableListView(
          children: [ for (var i = 0; i < tasks.length; i++)
            Dismissible(
              key: new Key(tasks[i].checked.toString()+tasks[i].title+tasks[i].date+tasks[i].desc),
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
                      title: Text(tasks[i].title),
                      subtitle: (tasks[i].date != '') ? Text(tasks[i].date) : null,
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
                builder: (_) => AddTaskScreen()
            ),
          ), //direct to add
      ),
    );
  }
}