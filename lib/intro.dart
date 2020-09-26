import 'package:flutter/material.dart';
import 'package:to_do/home.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/1.1.gif"),
            SizedBox(height: 50),
            FlatButton.icon(
                textColor: Colors.white,
                color: Color(0xffefb951),
                icon: Icon(Icons.forward),
                label: Text("Let's add tasks"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    )))
          ],
        ),
      ),
    );
  }
}
