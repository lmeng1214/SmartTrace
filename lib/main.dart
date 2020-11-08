import 'package:flutter/material.dart';

bool covid;

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
            //alert: showAlertDialog(context),
            title: Text('Smart Trace'),
          ),

          body: Center(child: MyLayout())),
    );
  }
}

class MyLayout extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Get started'),
        onPressed: () {

          showAlertDialog(context);
        },
      ),
    );
  }
}

class yesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (covid == true) {
              print("I HAVE COVID");
            } else {
              print("I AM COVID FREE");
            }


            },
          child: Text('Go back to the start'),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Yes"),
    onPressed: () {
      covid = true;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => yesButton()),
      );
    },
  );
  Widget continueButton = FlatButton(
    child: Text("No"),
    onPressed: () {
      covid = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => yesButton()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Before we continue..."),
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
