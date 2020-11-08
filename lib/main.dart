// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner',
      home: NearbyBluetooth(title: 'Bluetooth Scanner'),
    );
  }
}

class NearbyBluetooth extends StatefulWidget {
  NearbyBluetooth({Key key, this.title}) : super(key: key);

  final String title;

  bool includeUnknown = true;

  @override
  _NearbyBluetoothState createState() => _NearbyBluetoothState();

  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> _nearbyBTDevicesName = new List<BluetoothDevice>();
}

class _NearbyBluetoothState extends State<NearbyBluetooth> {
  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: _buildListViewOfDevices(),
  );

  _addDeviceToList(final BluetoothDevice device) {
    if (!widget._nearbyBTDevicesName.contains(device)) {
      setState(() {
        widget._nearbyBTDevicesName.add(device);
      });
    }
  }

  void initState() {
    super.initState();
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult r in results) {
        _addDeviceToList(r.device);
      }
    });
    widget.flutterBlue.startScan();
  }

  ListView _buildListViewOfDevices() {
    List<Container> containers = new List<Container>();

    for (BluetoothDevice device in widget._nearbyBTDevicesName) {
      if (!widget.includeUnknown && device.name == '') {
        continue;
      }
      containers.add(
        Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        ...containers,
      ],
    );
  }
}
