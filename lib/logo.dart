
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/Intro.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intro1())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width:200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("lib/images/health.png"),fit: BoxFit.cover
                )
              ),
            ),
          ),
          //SizedBox(height: 400,),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width:100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("lib/images/stay.png"),fit: BoxFit.cover
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




