import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController dateCtl = TextEditingController();

  String input;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
