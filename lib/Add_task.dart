import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String input;
  List todos = List();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Padding(
          padding: const EdgeInsets.only(left: 65.0),
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
                width: 75,
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
                  setState(() {
                    todos.add(input);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
    // ),
    // SizedBox(
    //   height: 12,
    // ),

    // //time
    // Container(
    //   width: 300,
    //   child: Time(),
    // ),

    // //date
    // SizedBox(
    //   height: 12,
    // ),

    // //time
    // Container(
    //   width: 300,
    //   child: Date(),
    // ),
    // // //save cancel
    // SizedBox(
    //   height: 18,
    // ),
  }
}
