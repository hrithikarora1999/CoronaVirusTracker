

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/HospitalBeds.dart';
import 'package:flutter_app/Medical.dart';
import 'package:flutter_app/NotificationAdvisory.dart';
import 'package:flutter_app/health.dart';
import 'package:flutter_app/helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CorWebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<CorWebView> {
   Completer<WebViewController>_controller=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: topAppBar,
      body: SafeArea(
        child: WebView(
          initialUrl: "https://www.google.com/search?source=hp&ei=kjVfX4W1FYrUz7sPwryx6AM&q=corona+virus+updates&oq=corona+virus+updates&gs_lcp=CgZwc3ktYWIQAzIHCAAQsQMQCjIFCAAQkgMyBQgAEJIDMgcIABCxAxAKMgQIABAKMgQIABAKMgQIABAKMgQIABAKMgQIABAKMgQIABAKOg4IABDqAhC0AhCaARDlAjoICAAQsQMQgwE6BQgAELEDOgIIADoKCAAQsQMQgwEQClD5DFjxNmDLOGgCcAB4AIABuwGIAeMTkgEEMC4yMZgBAKABAaoBB2d3cy13aXqwAQY&sclient=psy-ab&ved=0ahUKEwiFxsG5qOjrAhUK6nMBHUJeDD0Q4dUDCAc&uact=5",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ( WebViewController webviewController ){
             _controller.complete(webviewController);
          },
        ),
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
