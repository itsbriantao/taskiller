import 'package:flutter/material.dart';

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
  List<bool> checked = [true, true, false, false, true];
  Color primary = Color(0xFF2B2E33),
        secondary = Color(0xFFD6BD8E);

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
        child: Column(
          children: [
            for (var i = 0; i < 5; i += 1)
              CheckboxListTile(
                title: Text('Checkbox ${i+1}'),
                subtitle: Text(new. DateTime('yMd').format(New Datenow())
                value: checked[i],
                onChanged: (bool val) {
                  setState(() {
                    checked[i] = val;
                  });
                },
                activeColor: secondary,
                checkColor: Colors.blue,
              )
              // Row(
              //   // children: [
              //   //   Checkbox(
              //   //     onChanged: (bool value) {
              //   //       setState(() {
              //   //         checked[i] = value;
              //   //       });
              //   //     },
              //   //     value: checked[i],
              //   //     activeColor: secondary,
              //   //   ),
              //   //   Text(
              //   //     'Checkbox ${i + 1}',
              //   //     style: TextStyle(color: Colors.black)
              //   //   ),
              //   // ],
              //   children: [
              //     CheckboxListTile(
              //       title: Text('Checkbox ${i+1}'),
              //       value: checked[i],
              //       onChanged: (bool val) {
              //         setState(() {
              //           checked[i] = val;
              //         });
              //       },
              //       activeColor: secondary,
              //       checkColor: Colors.blue,
              //     )
              //   ]
              // ),
          ],
        ),
      ),
      // backgroundColor: primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: add a new task
        },
        child: Icon(
          Icons.add,
          color: primary,
          size: 40.0,
        ),
        backgroundColor: secondary,
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'TasKiller',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                fontFamily: 'Raleway'
              )),
            centerTitle: true,
            backgroundColor: Colors.amber[50]
        ),
        body: Column(
          children: [
            for (var i = 0; i < 5; i += 1)
              Row(
                children: [
                  Checkbox(
                    value: ,
                    onChanged: (bool val) {
                      setState(() {
                      })
                    },
                    activeColor: Color(0xFF6200EE),
                  ),
                  Text('Bruh ${i+1}...'),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
          ],
        ),
        backgroundColor: Colors.black54,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // add a new task
          },
          child: Icon(
            Icons.add,
            color: Colors.black54,
            size: 40.0,
          ),
          backgroundColor: Colors.amber[50],
        )
    );
  }
}*/

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/