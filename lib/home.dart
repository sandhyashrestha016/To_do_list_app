import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/intro.dart';
import 'package:to_do/profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input;
  List todos = List();

  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyTodos").doc(input);

    //Map
    Map<String, String> todos = {"todoTitle": input};

    documentReference.set(todos).whenComplete(() => print("$input created"));
  }

  deleteTodos() {}

  TextEditingController dateCtl = TextEditingController();

  TextEditingController timeCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget nodata() {
      return Column(
        children: [
          Image.asset("images/3.gif"),
          Text(
            "It seems there",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "are no task added yet",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    // ignore: unused_element
    Widget data() {
      return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("mytodos").snapshots(),
          builder: (context, snapshots) {
            print(snapshots.data.documents.length);
            return !snapshots.hasData
                ? Text('PLease Wait')
                : ListView.builder(
                    itemCount: snapshots.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshots.data.documents[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          title: Text(documentSnapshot.data()["todoTitle"]),
                          subtitle: Column(
                            children: [
                              Text(dateCtl.text),
                              Text(timeCtl.text),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    });
          });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        "Add new task",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.assignment,
                            color: Color(0xffefb951),
                          ),
                          hintText: 'Enter your task',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 3.5,
                            ),
                          ),
                        ),
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xffefb951),
                          ),
                          hintText: 'Set your date',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 3.5,
                            ),
                          ),
                        ),
                        controller: dateCtl,
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          dateCtl.text = date.toString().substring(0, 10);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.av_timer,
                            color: Color(0xffefb951),
                          ),
                          hintText: 'Set your time',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffefb951),
                              width: 3.5,
                            ),
                          ),
                        ),
                        controller: timeCtl,
                        onTap: () async {
                          TimeOfDay time = TimeOfDay.now();
                          FocusScope.of(context).requestFocus(new FocusNode());

                          TimeOfDay picked = await showTimePicker(
                              context: context, initialTime: time);
                          if (picked != null && picked != time)
                            setState(() {
                              time =
                                  picked.replacing(hour: picked.hourOfPeriod);
                            });
                          timeCtl.text = time.toString().substring(10, 15);
                        },
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          children: [
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              color: Colors.red[400],
                              elevation: 5,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              color: Colors.green[400],
                              onPressed: () {
                                createTodos();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text(
          'Add Task',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.add_circle),
        backgroundColor: Color(0xffefb951),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xffefb951),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: AssetImage('images/s.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Column(
                      children: [
                        Text("Sandhya Shrestha"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("sthsandhya016@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Color(0xffefb951),
            ),
            InkWell(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text("Change mode"),
                ),
              ),
              onTap: changeBrightness,
            ),
            Divider(
              thickness: 2,
              color: Color(0xffefb951),
            ),
            InkWell(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text("Log Out"),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Intro(),
                  )),
            ),
            Divider(
              thickness: 2,
              color: Color(0xffefb951),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
        backgroundColor: Color(0xffefb951),
      ),
      body: nodata(),
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
