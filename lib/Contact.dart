import 'package:flutter/material.dart';
import 'package:flutter_app/HospitalBeds.dart';
import 'package:flutter_app/Medical.dart';
import 'package:flutter_app/Models/ContactDetailsModel.dart';
import 'package:flutter_app/NetworkHelper.dart';
import 'package:flutter_app/NotificationAdvisory.dart';
import 'package:flutter_app/WebView.dart';
import 'package:flutter_app/health.dart';
import 'package:flutter_app/helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactDetails extends StatefulWidget {

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {

  Future<List<ContactModel>> GetData() async {
    NetworkHelper networkHelper=NetworkHelper(url: 'https://api.rootnet.in/covid19-in/contacts');
    var data=await networkHelper.getData();
    List<ContactModel> contacts=[];
    for(int i=0;i<37;i++)
      {

        ContactModel contact=ContactModel(stateName:data["data"]["contacts"]["regional"][i]["loc"],helpline: data["data"]["contacts"]["regional"][i]["number"]);
        contacts.add(contact);
      }
      print(contacts.length);
      return contacts;

  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter State',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white
                      ),
                      onChanged: (string) {

                      },
                    ),
                  ),
                  Icon(Icons.search,color: Colors.white,),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: GetData(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.data==null)
                    {
                      return SpinKitFadingCube(
                        color: Colors.green,
                        size: 80,
                        duration: Duration(seconds:3 ),
                      );
                    }
                 /* Container(
                    child: Center(child: Text('Loading')),
                  );*/
                  else
                    return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:snapshot.data.length ,
                    itemBuilder: (BuildContext context, int index) {
                      return makeCard(snapshot.data[index]);
                    },
                  );
                },
              ),
            ),
          ],
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



