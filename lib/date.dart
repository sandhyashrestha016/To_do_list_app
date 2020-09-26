import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
