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
          body: Column(
            children: <Widget>[Image.network('https://www.nhpr.org/sites/nhpr/files/202010/CoronavirusBall_red_CDChighrez.png'),
              MyLayout()]
          ),
        // body: Center(
          //   child: MyLayout(),
          //   ),
          ),
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
        color: Colors.blue,
        textColor: Colors.white,
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
        child: RaisedButton(
          onPressed: () {

            },
          child: Text('PLEASE SOCIALLY DISTANCE AND KEEP YOUR MASK ON', style: TextStyle(fontSize: 20)),
          color: Colors.red,
          textColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}

class noButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),

      body: Center(
        child: RaisedButton(
          onPressed: () {

          },
          child: Text('Your phone will vibrate when someone with COVID-19 is near you :)', style: TextStyle(fontSize: 20)),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 0,
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
        MaterialPageRoute(builder: (context) => noButton()),
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
