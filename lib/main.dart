import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Welcome to SmartTrace',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Welcome to SmartTrace'),
// //         ),
// //         body: Center(
// //           child: Text('Hello World'),
// //         ),
// //       ),
// //     );
// //   }
// // }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to SmartTrace',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
          ),
          body: MyLayout()),
    );
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {},
  );
  Widget continueButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      Text("fuck nigg");
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Have you tested Positive for COVID-19 in the past 2 weeks?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
