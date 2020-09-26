import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TextEditingController timeCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

        TimeOfDay picked =
            await showTimePicker(context: context, initialTime: time);
        if (picked != null && picked != time)
          setState(() {
            time = picked.replacing(hour: picked.hourOfPeriod);
          });
        timeCtl.text = time.toString();
      },
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'cant be empty';
      //   }
      //   return null;
      // },
    );
  }
}
