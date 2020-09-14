import 'package:flutter/material.dart';
import 'package:flutter_app/Contact.dart';
import 'package:flutter_app/Medical.dart';
import 'package:flutter_app/Models/ContactDetailsModel.dart';
import 'package:flutter_app/Models/HospitalModel.dart';
import 'package:flutter_app/Models/MedicalModel.dart';
import 'package:flutter_app/Models/NotificationModel.dart';
import 'package:flutter_app/NetworkHelper.dart';
import 'package:flutter_app/services/CallServices.dart';
import 'package:flutter_app/services/servicelocator.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import 'services/Hyperlink.dart';

final CallsAndMessagesService _service = locator<CallsAndMessagesService>();







  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Center(child: Text('Corona State Wise Helpline ')),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
final topAppBarHosp = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  title: Center(child: Text('Hospital Bed Details ')),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.list),
      onPressed: () {},
    )
  ],
);
final topAppBarNote = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  title: Center(child: Text('Notification and Advisory')),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.list),
      onPressed: () {},
    )
  ],
);

final topAppBarMED = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  title: Center(child: Text('Medical Institutions')),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.list),
      onPressed: () {},
    )
  ],
);

Card makeCard(ContactModel contact) => Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTile(contact),
  ),
);

Card makeCardNote(NotificationModel note) => Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTileNote(note),
  ),
);

Card makeCardHosp(HospitalModel note) => Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTileHosp(note),
  ),
);

Card makeCardMedical(MedicalModel note) => Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTileMed(note),
  ),
);



ListTile makeListTile(ContactModel contact) => ListTile(
contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      contact.stateName,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Expanded(child: Text(contact.helpline, style: TextStyle(color: Colors.white)))
      ],
    ),
    trailing:
    GestureDetector(
        onTap: () {

          _service.call(contact.helpline);

        },
        child: Icon(Icons.phone, color: Colors.green, size: 30.0,)));


ListTile makeListTileNote(NotificationModel contact) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contact.title.substring(0,10),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          contact.title.substring(11,contact.title.length),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),

    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Expanded(child: Hyperlink(contact.link, contact.link,),)
      ],
    ),
    /*trailing:
    Icon(Icons.phone, color: Colors.white, size: 30.0)*/
   );

ListTile makeListTileHosp(HospitalModel contact) => ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration(
        border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white24))),
    child: Icon(Icons.autorenew, color: Colors.white),
  ),
  title: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'StateName :'+contact.stateName,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Rural Hospitals:' +contact.ruralHos.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Rural Beds : '+contact.ruralBeds.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Urban Hospitals :'+contact.urbanHos.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Urban Beds:'+contact.urbanBeds.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Total Hospitals:'+contact.totalHosp.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Total Beds S/W:'+contact.totalBeds.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ],
  ),
);


ListTile makeListTileMed(MedicalModel contact) => ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration(
        border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.white24))),
    child: Icon(Icons.autorenew, color: Colors.white),
  ),
  title: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'StateName :'+contact.StateName.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Institute Name:' +contact.InstituteName.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'City : '+contact.City.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Type :'+contact.Type.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Admission Capacity:'+contact.Admission.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        'Total Beds:'+contact.HospBeds.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ],
  ),
);