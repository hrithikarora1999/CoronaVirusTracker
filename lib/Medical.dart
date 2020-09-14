
import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/HospitalBeds.dart';
import 'package:flutter_app/Models/MedicalModel.dart';
import 'package:flutter_app/NetworkHelper.dart';
import 'package:flutter_app/NotificationAdvisory.dart';
import 'package:flutter_app/WebView.dart';
import 'package:flutter_app/health.dart';
import 'package:flutter_app/helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Medical extends StatefulWidget {
  @override
  _MedicalState createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {

  Future<List<MedicalModel>> GetData() async {
    NetworkHelper networkHelper=NetworkHelper(url: 'https://api.rootnet.in/covid19-in/hospitals/medical-colleges');
    var data=await networkHelper.getData();
    print(data);
    List<MedicalModel> contacts=[];
    List<MedicalModel>filtered=[];
    for(int i=0;i<500;i++)
    {

      MedicalModel contact=MedicalModel(
          StateName:data["data"]["medicalColleges"][i]["state"],
          InstituteName: data["data"]["medicalColleges"][i]["name"],
          City:data["data"]["medicalColleges"][i]["city"],
          Type: data["data"]["medicalColleges"][i]["ownership"],
          Admission: data["data"]["medicalColleges"][i]["admissionCapacity"],
          HospBeds: data["data"]["medicalColleges"][i]["hospitalBeds"],
          );
          contacts.add(contact);
    }
    print(contacts.length);
    return contacts;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBarMED,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () {
         // FilterList();
        },

      ),
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
                          hintText: 'Search for State Or Type',
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
              FutureBuilder(
                future: GetData(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.data==null)
                  {
                    return Center(
                      child: SpinKitFadingCube(
                        color: Colors.green,
                        size: 80,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                  else
                  {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:snapshot.data.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return makeCardMedical(snapshot.data[index]);
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
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
    );;
  }
}
