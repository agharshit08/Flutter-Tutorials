// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';

// class FlushbarScreen extends StatelessWidget {
//   void _showFlushbar(context) {
//     Flushbar(
//       title: "Hey Flutter dev!",
//       message:
//           "You are watching top 10 UI packages in Flutter!",
//       duration: Duration(seconds: 3),
//       leftBarIndicatorColor: Colors.blue,
//       icon: Icon(Icons.info, color: Colors.blue,),
//       flushbarPosition: FlushbarPosition.TOP,
//       flushbarStyle: FlushbarStyle.GROUNDED,
//       mainButton: FlatButton(
//         onPressed: () {
//           print('Clapped');
//         },
//         child: Text(
//           "CLAP",
//           style: TextStyle(color: Colors.amber),
//         ),
//       ),
//     )..show(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alerts: Like a pro!'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text('Show Flushbar'),
//           onPressed: () => _showFlushbar(context),
//         ),
//       ),
//     );
//   }
// }
