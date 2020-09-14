
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Intro2.dart';
import 'package:flutter_app/health.dart';

class Intro1 extends StatefulWidget {
  @override
  _Intro1State createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Health())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(child: Image(image: AssetImage('lib/images/cor1.jpeg'),)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 110.0),
            child: Card(
              color: Colors.white,
              elevation: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Welcome to Corona Virus Tracker',style: TextStyle(
                      color: Colors.black,fontSize: 17,
                    ),),
                    Text('Stay Home Stay Safe',style: TextStyle(
                      color: Colors.black,fontSize: 17,
                    ),),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
