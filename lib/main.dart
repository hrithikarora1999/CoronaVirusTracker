import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/NotificationAdvisory.dart';
import 'package:flutter_app/logo.dart';

import 'services/servicelocator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Colors.black),
      home: Logo(),
    );
  }
}

