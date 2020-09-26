// import 'package:flutter/material.dart';

// class List extends StatefulWidget {
//   @override
//   _ListState createState() => _ListState();
// }

// class _ListState extends State<List> {
//   List todos = List();
//   @override
//   void initState() {
//     super.initState();
//     todos.add("Item1");
//     todos.add("Item2");
//     todos.add("Item3");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Dismissible(
//                 key: Key(todos[index]),
//                 child: Card(
//                   child: ListTile(
//                     title: Text(todos[index]),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
