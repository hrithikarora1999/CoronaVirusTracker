
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/HospitalBeds.dart';
import 'package:flutter_app/Medical.dart';
import 'package:flutter_app/NotificationAdvisory.dart';
import 'package:flutter_app/WebView.dart';
import 'package:flutter_app/services/CallServices.dart';
import 'package:flutter_app/services/servicelocator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Chatbot.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String helpline="011-23978046";
  void launchWhatsApp({@required String phone, @required String message,}) async
  {
    String url() {
      return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
    }
    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(95.0),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  image: DecorationImage(image: AssetImage('lib/images/health.png'),fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Not Feeling Well ?',style: TextStyle(fontSize: 25,color: Colors.blue,letterSpacing: 1.2,fontWeight: FontWeight.w600),),
                ),
                //Text('Press The Button Below',style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w600),),
                GestureDetector(
                    onTap:() {
                        _service.call(helpline);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone,size: 60,color: Colors.blue,),
                          GestureDetector(
                            onTap: () {
                              launchWhatsApp(phone: "9013151515", message: "Hi");
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('lib/images/whatsapp.png'),fit: BoxFit.cover)
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
    ],
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.phone_android, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ContactDetails()));
                },
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Notification1()));
                },
              ),
              IconButton(
                icon: Icon(Icons.healing, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Health()));
                },
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HospitalData()));
                },
              ),
              IconButton(
                icon: Icon(Icons.local_hospital, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Medical()));

                },
              ),
              IconButton(
                icon: Icon(Icons.multiline_chart, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CorWebView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
