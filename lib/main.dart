// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner',
      home: nearbyBluetooth(),
    );
  }
}

class nearbyBluetooth extends StatefulWidget {
  @override
  _nearbyBluetoothState createState() => _nearbyBluetoothState();
}

class _nearbyBluetoothState extends State<nearbyBluetooth> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Widget build(BuildContext context) {
    final _nearbyBTDevices = <String>[];
    final _biggerFont = TextStyle(fontSize: 18.0);

    flutterBlue.startScan(timeout: Duration(seconds: 5));

    var subscription = flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        _nearbyBTDevices.add('${r.device.name} | RSSI: ${r.rssi}');
      }
    });

    flutterBlue.stopScan();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Scanner'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          if (index >= _nearbyBTDevices.length) {
            return ListTile(
              title: Text(
                'NULL',
                style: _biggerFont,
              )
            );
          }

          return ListTile(
            title: Text(
              _nearbyBTDevices[index],
              style: _biggerFont,
            )
          );
        }
      )
    );
  }
}

