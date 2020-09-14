
import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/HospitalBeds.dart';
import 'package:flutter_app/Medical.dart';
import 'package:flutter_app/Models/NotificationModel.dart';
import 'package:flutter_app/NetworkHelper.dart';
import 'package:flutter_app/WebView.dart';
import 'package:flutter_app/health.dart';
import 'package:flutter_app/helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Notification1 extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {

  Future<List<NotificationModel>> GetData() async {
    NetworkHelper networkHelper=NetworkHelper(url: 'https://api.rootnet.in/covid19-in/notifications');
    var data=await networkHelper.getData();
    List<NotificationModel> notifications=[];
    for(int i=0;i<132;i++)
    {
      NotificationModel contact=NotificationModel(title:data["data"]["notifications"][i]["title"],link: data["data"]["notifications"][i]["link"]);
      notifications.add(contact);
    }
    print(notifications.length);
    return notifications;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBarNote,
      body: Container(
          child: FutureBuilder(
            future: GetData(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.data==null)
              {
                return SpinKitFadingCube(
                  color: Colors.green,
                  size: 80,
                  duration: Duration(seconds: 3),
                );
              }
              else
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:snapshot.data.length ,
                  itemBuilder: (BuildContext context, int index) {
                    return makeCardNote(snapshot.data[index+1]);
                  },
                );
            },
          )
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.phone_android, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ContactDetails()));
                },
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Notification1()));
                },
              ),
              IconButton(
                icon: Icon(Icons.healing, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Health()));
                },
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HospitalData()));
                },
              ),
              IconButton(
                icon: Icon(Icons.local_hospital, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Medical()));

                },
              ),
              IconButton(
                icon: Icon(Icons.multiline_chart, color: Colors.white),
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
