

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/health.dart';

class Intro2 extends StatefulWidget {
  @override
  _Intro2State createState() => _Intro2State();

}

class _Intro2State extends State<Intro2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Health())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.black,
            body: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(image: AssetImage('lib/images/cor2.jpeg'),))
        );
  }
}
